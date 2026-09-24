import 'dart:async';

import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/ui/scanner/platform/barcode_scanner_session.dart';
import 'package:discount_card_app/ui/scanner/platform/camera_permission_client.dart';
import 'package:discount_card_app/ui/scanner/state/scanner_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit(this._permissions, this._sessions) : super(const ScannerState());

  final CameraPermissionClient _permissions;
  final BarcodeScannerSessionFactory _sessions;

  BarcodeScannerSession? _session;
  StreamSubscription<ScannerWireEvent>? _subscription;
  var _scanLocked = false;
  var _covered = false;
  var _openSettingsOnDeny = false;

  Future<void> checkPermission() async {
    final permission = await _permissions.current();
    if (isClosed) return;
    emit(state.copyWith(permission: _visiblePermission(permission)));
  }

  Future<void> requestPermission() async {
    if (_openSettingsOnDeny) {
      emit(state.copyWith(permission: ScannerPermission.permanentlyDenied));
      await openSettings();
      return;
    }

    final permission = await _permissions.request();
    if (isClosed) return;
    if (permission == ScannerPermission.granted) {
      _openSettingsOnDeny = false;
      emit(state.copyWith(permission: permission));
      return;
    }

    final askAgain = await _permissions.canAskAgain();
    if (isClosed) return;
    if (permission == ScannerPermission.permanentlyDenied || !askAgain) {
      _openSettingsOnDeny = true;
      emit(state.copyWith(permission: ScannerPermission.permanentlyDenied));
      await openSettings();
      return;
    }
    emit(state.copyWith(permission: permission));
  }

  Future<void> openSettings() {
    return _permissions.openSettings();
  }

  Future<void> onAppResumed() async {
    final permission = await _permissions.current();
    if (isClosed) return;
    final visiblePermission = _visiblePermission(permission);
    final wasGranted = state.permission == ScannerPermission.granted;
    emit(
      state.copyWith(
        permission: visiblePermission,
        phase: visiblePermission == ScannerPermission.granted
            ? state.phase
            : const ScannerPhase.idle(),
        torch: visiblePermission == ScannerPermission.granted
            ? state.torch
            : ScannerTorch.hidden,
      ),
    );
    if (visiblePermission != ScannerPermission.granted ||
        _covered ||
        !wasGranted) {
      return;
    }
    if (state.phase is ScannerPhaseRunning ||
        state.phase is ScannerPhaseStarting) {
      return;
    }
    if (_session != null) await _start();
  }

  Future<void> onViewCreated(int viewId) async {
    await _subscription?.cancel();
    _session = _sessions.create(viewId);
    _subscription = _session!.events().listen(_onEvent);
    await _start();
  }

  Future<void> onViewDisposed() async {
    await _subscription?.cancel();
    _subscription = null;
    _session = null;
  }

  Future<void> retry() => _start();

  Future<void> toggleTorch() async {
    final session = _session;
    if (session == null || state.torch == ScannerTorch.hidden) return;
    final enabled = state.torch != ScannerTorch.on;
    try {
      await session.setTorch(enabled);
      if (isClosed) return;
      emit(
        state.copyWith(torch: enabled ? ScannerTorch.on : ScannerTorch.off),
      );
    } on TorchUnavailableException {
      if (isClosed) return;
      emit(state.copyWith(torch: ScannerTorch.hidden));
    } on TorchFailedException {
      return;
    }
  }

  Future<void> stopForNavigation() async {
    _covered = true;
    await _session?.stop();
    if (isClosed) return;
    emit(
      state.copyWith(
        phase: const ScannerPhase.stopped(),
        torch: ScannerTorch.hidden,
      ),
    );
  }

  Future<void> resumeAfterNavigation() async {
    _covered = false;
    _scanLocked = false;
    if (isClosed) return;
    emit(state.copyWith(pendingBarcode: null));
    await _start();
  }

  Future<void> _start() async {
    final session = _session;
    if (session == null || isClosed || _covered) return;
    emit(
      state.copyWith(
        phase: const ScannerPhase.starting(),
        torch: ScannerTorch.hidden,
      ),
    );
    try {
      final result = await session.start();
      if (isClosed || _covered) return;
      switch (result) {
        case CameraStarted(:final torchAvailable):
          emit(
            state.copyWith(
              phase: const ScannerPhase.running(),
              torch: torchAvailable ? ScannerTorch.off : ScannerTorch.hidden,
            ),
          );
        case CameraStartIgnored():
          break;
      }
    } on CameraInitializationException {
      if (isClosed) return;
      emit(
        state.copyWith(
          phase: const ScannerPhase.failed(),
          torch: ScannerTorch.hidden,
        ),
      );
    }
  }

  ScannerPermission _visiblePermission(ScannerPermission permission) {
    if (permission == ScannerPermission.granted) {
      _openSettingsOnDeny = false;
      return permission;
    }
    if (_openSettingsOnDeny) return ScannerPermission.permanentlyDenied;
    return permission;
  }

  void _onEvent(ScannerWireEvent event) {
    if (isClosed || _scanLocked || _covered) return;
    switch (event) {
      case ScannerWireRejected():
        emit(state.copyWith(rejectionId: state.rejectionId + 1));
      case ScannerWireCode(:final value, :final format):
        if (format == BarcodeFormat.unknown) {
          emit(state.copyWith(rejectionId: state.rejectionId + 1));
          return;
        }
        _scanLocked = true;
        emit(
          state.copyWith(pendingBarcode: (value: value, format: format)),
        );
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}

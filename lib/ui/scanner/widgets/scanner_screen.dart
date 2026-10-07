import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/scanner/controller/scanner_controller.dart';
import 'package:discount_card_app/ui/scanner/state/scanner_state.dart';
import 'package:discount_card_app/ui/scanner/widgets/scanner_view.dart';
import 'package:discount_card_app/ui/shared/ui/app_button.dart';
import 'package:flutter/material.dart';

import '../../shared/themes/app_dimensions.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen>
    with WidgetsBindingObserver {
  ScannerController? _scannerController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // TODO(riverpod): перепроверить разрешение камеры, если текущее состояние — ScannerRequiredPermissionState или ScannerPermissionPermanentlyDeniedState (пользователь мог выдать доступ в настройках).
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO(riverpod): на ScannerDataSuccessState остановить _scannerController, открыть EditorRouteData с найденным штрихкодом, а после возврата (если виджет ещё смонтирован) снова запустить сканер и перевести состояние в cameraRunning.
    // TODO(riverpod): подписаться на состояние сканера; при первом открытии экрана должна выполняться проверка разрешения камеры.
    const state = ScannerState.initial();

    return switch (state) {
      ScanerInitialState() => _buildScannerLoading(context),
      ScannerRequiredPermissionState() => _buildRequiredPermission(context),
      ScannerPermissionPermanentlyDeniedState() =>
        _buildPermissionPermanentlyDenied(context),

      ScannerPermissionGrantedState() ||
      ScannerCameraRunningState() ||
      ScannerDataSuccessState() => _buildCameraLayer(context, state),

      ScannerCameraErrorState() => _buildCameraError(context, state.message),
    };
  }

  Widget _buildCameraLayer(BuildContext context, ScannerState state) {
    final isTorchEnabled = state is ScannerCameraRunningState
        ? state.isTorchEnabled
        : false;

    return Stack(
      fit: StackFit.expand,
      children: [
        ScannerView(
          onCreated: (controller) => _scannerController = controller,
          isTorchEnabled: isTorchEnabled,
          // TODO(riverpod): каждый колбэк ниже должен менять состояние сканера: камера запущена, найден штрихкод, ошибка данных, ошибка фонарика, ошибка камеры.
          onReady: () {},
          onBarcode: (barcode) {},
          onDataError: (message) {},
          onTorchError: (message) {},
          onCameraError: (message) {},
        ),

        if (state is ScannerPermissionGrantedState) ...[
          _buildScannerLoading(context),
        ],

        if (state is ScannerCameraRunningState) ...[
          _buildScannerOverlay(),
          _buildTorchButton(context, isTorchEnabled),
        ],
      ],
    );
  }
}

Widget _buildScannerLoading(BuildContext context) {
  return Center(child: CircularProgressIndicator());
}

Widget _buildRequiredPermission(BuildContext context) {
  final theme = Theme.of(context);
  final textTheme = theme.textTheme;
  final colorScheme = theme.colorScheme;

  return Padding(
    padding: const EdgeInsetsGeometry.symmetric(horizontal: AppSpacing.lg),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          context.l10n.requiredPermissionForCamera,
          style: textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.md),
        AppButton(
          text: context.l10n.allow,
          backgroundColor: colorScheme.primary,
          textColor: colorScheme.onPrimary,
          // TODO(riverpod): запросить разрешение камеры и обновить состояние сканера по результату.
          onPressed: () {},
        ),
      ],
    ),
  );
}

Widget _buildPermissionPermanentlyDenied(BuildContext context) {
  final theme = Theme.of(context);
  final textTheme = theme.textTheme;
  final colorScheme = theme.colorScheme;

  return Padding(
    padding: const EdgeInsetsGeometry.symmetric(horizontal: AppSpacing.lg),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          context.l10n.permissionDeniedForCamera,
          style: textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.md),
        AppButton(
          text: context.l10n.openSettings,
          backgroundColor: colorScheme.primary,
          textColor: colorScheme.onPrimary,
          // TODO(riverpod): открыть настройки приложения.
          onPressed: () {},
        ),
      ],
    ),
  );
}

Widget _buildCameraError(BuildContext context, String message) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline, color: Colors.red, size: 48),
        const SizedBox(height: 16),
        Text(message, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 16),
        ElevatedButton(
          // TODO(riverpod): заново проверить разрешение камеры и перезапустить сканер.
          onPressed: () {},
          child: const Text('Retry'),
        ),
      ],
    ),
  );
}

Widget _buildScannerOverlay() {
  return ColorFiltered(
    colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.srcOut),
    child: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            backgroundBlendMode: BlendMode.dstOut,
          ),
        ),

        Center(
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildTorchButton(BuildContext context, bool isTorchEnabled) {
  return Positioned(
    bottom: 40,
    left: 0,
    right: 0,
    child: Center(
      child: FloatingActionButton(
        backgroundColor: isTorchEnabled ? Colors.white : Colors.black54,
        // TODO(riverpod): переключить фонарик в состоянии сканера.
        onPressed: () {},
        child: Icon(
          isTorchEnabled ? Icons.flash_on : Icons.flash_off,
          color: isTorchEnabled ? Colors.black : Colors.white,
        ),
      ),
    ),
  );
}

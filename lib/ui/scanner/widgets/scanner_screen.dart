import 'dart:async';

import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/router/app_router.dart';
import 'package:discount_card_app/ui/scanner/platform/barcode_scanner_session.dart';
import 'package:discount_card_app/ui/scanner/platform/camera_permission_client.dart';
import 'package:discount_card_app/ui/scanner/state/scanner_cubit.dart';
import 'package:discount_card_app/ui/scanner/state/scanner_state.dart';
import 'package:discount_card_app/ui/scanner/widgets/scanner_overlay.dart';
import 'package:discount_card_app/ui/scanner/widgets/scanner_preview.dart';
import 'package:discount_card_app/ui/shared/themes/app_colors.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:discount_card_app/ui/shared/ui/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = ScannerCubit(
          CameraPermissionClient(),
          BarcodeScannerSessionFactory(),
        );
        unawaited(cubit.checkPermission());
        return cubit;
      },
      child: const ScannerScreen(),
    );
  }
}

class ScannerUnavailablePage extends StatelessWidget {
  const ScannerUnavailablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Text(
            context.l10n.scannerUnavailable,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen>
    with WidgetsBindingObserver {
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
      unawaited(context.read<ScannerCubit>().onAppResumed());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MultiBlocListener(
        listeners: [
          BlocListener<ScannerCubit, ScannerState>(
            listenWhen: (previous, current) =>
                previous.pendingBarcode != current.pendingBarcode &&
                current.pendingBarcode != null,
            listener: (context, state) async {
              final barcode = state.pendingBarcode!;
              final cubit = context.read<ScannerCubit>();
              await cubit.stopForNavigation();
              if (!context.mounted) return;
              await EditorRouteData(
                barcodeNumber: barcode.value,
                barcodeFormat: barcode.format,
              ).push(context);
              if (!context.mounted) return;
              await cubit.resumeAfterNavigation();
            },
          ),
          BlocListener<ScannerCubit, ScannerState>(
            listenWhen: (previous, current) =>
                previous.permission == ScannerPermission.granted &&
                current.permission != ScannerPermission.granted,
            listener: (context, state) {
              unawaited(context.read<ScannerCubit>().onViewDisposed());
            },
          ),
          BlocListener<ScannerCubit, ScannerState>(
            listenWhen: (previous, current) =>
                previous.rejectionId != current.rejectionId,
            listener: (context, state) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text(context.l10n.scannerUnsupportedCode)),
                );
            },
          ),
        ],
        child: BlocBuilder<ScannerCubit, ScannerState>(
          buildWhen: (previous, current) =>
              previous.permission != current.permission ||
              previous.phase != current.phase,
          builder: (context, state) {
            return switch (state.permission) {
              ScannerPermission.unknown => const Center(
                child: CircularProgressIndicator(),
              ),
              ScannerPermission.denied ||
              ScannerPermission.permanentlyDenied => _PermissionView(
                permanent:
                    state.permission == ScannerPermission.permanentlyDenied,
              ),
              ScannerPermission.granted => const _CameraView(),
            };
          },
        ),
      ),
    );
  }
}

class _CameraView extends StatelessWidget {
  const _CameraView();

  @override
  Widget build(BuildContext context) {
    final failed = context.select(
      (ScannerCubit cubit) => cubit.state.phase is ScannerPhaseFailed,
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        const ScannerPreview(),
        if (failed) const _CameraError() else const ScannerOverlay(),
      ],
    );
  }
}

class _PermissionView extends StatelessWidget {
  const _PermissionView({required this.permanent});

  final bool permanent;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return ColoredBox(
      color: AppColors.background,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.scannerPermissionTitle,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                permanent
                    ? l10n.scannerPermissionPermanentMessage
                    : l10n.scannerPermissionMessage,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.lg),
              AppButton(
                onPressed: () {
                  final cubit = context.read<ScannerCubit>();
                  if (permanent) {
                    unawaited(cubit.openSettings());
                  } else {
                    unawaited(cubit.requestPermission());
                  }
                },
                text: permanent
                    ? l10n.scannerOpenSettings
                    : l10n.scannerPermissionButton,
                backgroundColor: colorScheme.primary,
                textColor: colorScheme.onPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CameraError extends StatelessWidget {
  const _CameraError();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ColoredBox(
      color: AppColors.background,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.l10n.scannerCameraError,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              AppButton(
                onPressed: () => context.read<ScannerCubit>().retry(),
                text: context.l10n.retry,
                backgroundColor: colorScheme.primary,
                textColor: colorScheme.onPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

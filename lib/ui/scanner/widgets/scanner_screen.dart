import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/router/app_router.dart';
import 'package:discount_card_app/ui/scanner/controller/scanner_controller.dart';
import 'package:discount_card_app/ui/scanner/state/scanner_bloc.dart';
import 'package:discount_card_app/ui/scanner/state/scanner_event.dart';
import 'package:discount_card_app/ui/scanner/state/scanner_state.dart';
import 'package:discount_card_app/ui/scanner/widgets/scanner_view.dart';
import 'package:discount_card_app/ui/shared/ui/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/themes/app_dimensions.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScannerBloc()..add(ScannerInitialized()),
      child: const ScannerScreen(),
    );
  }
}

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
      final currentState = context.read<ScannerBloc>().state;

      if (currentState is ScannerPermissionPermanentlyDeniedState ||
          currentState is ScannerRequiredPermissionState) {
        context.read<ScannerBloc>().add(ScannerInitialized());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScannerBloc, ScannerState>(
      listener: (context, state) async {
        if (state is ScannerDataSuccessState) {
          _scannerController?.stopScanner();

          await EditorRouteData(
            barcodeNumber: state.barcodeNumber,
            barcodeFormat: state.barcodeFormat,
          ).push(context);

          if (context.mounted) {
            _scannerController?.startScanner();
            context.read<ScannerBloc>().add(ScannerStarted());
          }
        }
      },
      builder: (context, state) {
        return switch (state) {
          ScanerInitialState() => _buildScannerLoading(context),
          ScannerRequiredPermissionState() => _buildRequiredPermission(context),
          ScannerPermissionPermanentlyDeniedState() =>
            _buildPermissionPermanentlyDenied(context),

          ScannerPermissionGrantedState() ||
          ScannerCameraRunningState() ||
          ScannerDataSuccessState() => _buildCameraLayer(context, state),

          ScannerCameraErrorState() => _buildCameraError(
            context,
            state.message,
          ),
        };
      },
    );
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
          onReady: () => context.read<ScannerBloc>().add(ScannerStarted()),
          onBarcode: (barcode) => context.read<ScannerBloc>().add(
            ScannerBarcodeDetected(barcode: barcode),
          ),
          onDataError: (message) => context.read<ScannerBloc>().add(
            ScannerDataErrorOccurred(message: message ?? ""),
          ),
          onTorchError: (message) => context.read<ScannerBloc>().add(
            ScannerTorchErrorOccurred(message: message ?? ""),
          ),
          onCameraError: (msg) => context.read<ScannerBloc>().add(
            ScannerCameraErrorOccurred(message: msg ?? ''),
          ),
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
          onPressed: () => context.read<ScannerBloc>().add(
            const ScannerPermissionRequestPressed(),
          ),
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
          onPressed: () => context.read<ScannerBloc>().add(
            const ScannerOpenSettingsPressed(),
          ),
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
          onPressed: () =>
              context.read<ScannerBloc>().add(ScannerInitialized()),
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
        onPressed: () {
          context.read<ScannerBloc>().add(ScannerTorchPressed());
        },
        child: Icon(
          isTorchEnabled ? Icons.flash_on : Icons.flash_off,
          color: isTorchEnabled ? Colors.black : Colors.white,
        ),
      ),
    ),
  );
}

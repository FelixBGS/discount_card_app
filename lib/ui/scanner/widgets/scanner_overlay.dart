import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/scanner/state/scanner_cubit.dart';
import 'package:discount_card_app/ui/scanner/state/scanner_state.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScannerOverlay extends StatelessWidget {
  const ScannerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final torch = context.select((ScannerCubit cubit) => cubit.state.torch);
    final showProgress = context.select(
      (ScannerCubit cubit) => cubit.state.phase is ScannerPhaseStarting,
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        const CustomPaint(painter: _ScanWindowPainter()),
        if (showProgress) const Center(child: CircularProgressIndicator()),
        SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: torch == ScannerTorch.hidden
                ? const SizedBox.shrink()
                : IconButton(
                    tooltip: context.l10n.scannerTorch,
                    onPressed: () => context.read<ScannerCubit>().toggleTorch(),
                    icon: Icon(
                      torch == ScannerTorch.on
                          ? Icons.flash_on
                          : Icons.flash_off,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.lg),
              child: Text(
                context.l10n.scannerHint,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ScanWindowPainter extends CustomPainter {
  const _ScanWindowPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final window = Rect.fromCenter(
      center: Offset(size.width / 2, size.height * 0.42),
      width: size.width * 0.72,
      height: size.width * 0.42,
    );
    final overlay = Path()
      ..addRect(Offset.zero & size)
      ..addRRect(
        RRect.fromRectAndRadius(
          window,
          const Radius.circular(AppSizes.radiusLarge),
        ),
      );
    overlay.fillType = PathFillType.evenOdd;
    canvas.drawPath(
      overlay,
      Paint()
        ..color = const Color(0x8C000000)
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant _ScanWindowPainter oldDelegate) => false;
}

import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';

class PanelContainer extends StatelessWidget {
  const PanelContainer({
    super.key,
    required this.borderColor,
    required this.child,
    this.padding = AppSpacing.md,
  });

  final Widget child;
  final Color borderColor;
  final double padding;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
        border: Border.all(color: borderColor, width: AppSizes.borderWidth),
        color: colorScheme.surface,
      ),
      child: child,
    );
  }
}

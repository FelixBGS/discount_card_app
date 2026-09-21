import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';

class PanelContainer extends StatelessWidget {
  const PanelContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
        border: Border.all(
          color: colorScheme.outlineVariant,
          width: AppSizes.borderWidth,
        ),
        color: colorScheme.surface,
      ),
      child: child,
    );
  }
}

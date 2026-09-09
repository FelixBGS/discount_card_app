import 'package:discount_card_app/ui/core/themes/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiscountCardPanel extends StatelessWidget {
  const DiscountCardPanel({
    super.key,
    required this.iconUrl,
    required this.shopName,
    required this.categoryName,
    required this.color,
    required this.onPressed,
  });

  final String iconUrl;
  final String shopName;
  final String categoryName;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
        splashColor: Colors.white.withValues(alpha: 0.3),
        highlightColor: Colors.white.withValues(alpha: 0.1),
        splashFactory: InkRipple.splashFactory,
        child: Ink(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
            color: color,
          ),
          child: Row(
            children: [
              SvgPicture.network(
                iconUrl,
                width: AppSizes.iconLarge,
                height: AppSizes.iconLarge,
              ),
              const SizedBox(width: AppSpacing.lg),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shopName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(categoryName),
                ],
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}

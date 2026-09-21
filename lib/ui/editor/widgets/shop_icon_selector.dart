import 'package:discount_card_app/ui/shared/ui/universal_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../../domain/models/logo_source.dart';
import '../../shared/themes/app_dimensions.dart';
import '../../util/utils.dart';

class ShopIconSelector extends StatelessWidget {
  const ShopIconSelector({
    super.key,
    required this.logo,
    required this.onPressed,
  });

  final LogoSource logo;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
        child: Ink(
          padding: const EdgeInsets.all(AppSpacing.xxs),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
            color: colorScheme.surface,
          ),
          child: UniversalIcon(
            logo: logo,
            width: AppSizes.logoMedium,
            height: AppSizes.logoMedium,
          ),
        ),
      ),
    );
  }
}

@Preview(
  name: "Shop Icon Selector",
  group: "Editor Screen",
  theme: appPreviewTheme,
)
Widget shopIconSelectorPreview() =>
    ShopIconSelector(logo: LogoSource.empty(), onPressed: () {});

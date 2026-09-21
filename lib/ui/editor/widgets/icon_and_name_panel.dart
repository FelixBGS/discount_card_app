import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/editor/widgets/shop_icon_selector.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:discount_card_app/ui/shared/ui/panel_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../../domain/models/logo_source.dart';
import '../../shared/ui/app_text_field.dart';
import '../../util/utils.dart';

class IconAndNamePanel extends StatelessWidget {
  const IconAndNamePanel({
    super.key,
    required this.logo,
    required this.onChangeIconPressed,
    required this.onNameChanged,
  });

  final LogoSource logo;
  final VoidCallback onChangeIconPressed;
  final VoidCallback onNameChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return PanelContainer(
      borderColor: colorScheme.outline,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.l10n.iconAndShopNameTitle, style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              ShopIconSelector(logo: logo, onPressed: () {}),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: AppTextField(
                  controller: TextEditingController(),
                  labelText: context.l10n.shopNameLabel,
                  showClearButton: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

@Preview(
  name: "Icon And Name Panel",
  group: "Editor Screen",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
)
Widget categorySelectorPanelPreview() => SizedBox(
  width: 500,
  child: IconAndNamePanel(
    logo: LogoSource.empty(),
    onChangeIconPressed: () {},
    onNameChanged: () {},
  ),
);

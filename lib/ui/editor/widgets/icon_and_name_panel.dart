import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/editor/widgets/shop_icon_selector.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:discount_card_app/ui/shared/ui/panel_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../../domain/models/logo_source.dart';
import '../../shared/ui/app_text_field.dart';
import '../../utils/preview_utils.dart';

class IconAndNamePanel extends StatefulWidget {
  const IconAndNamePanel({
    super.key,
    required this.logo,
    required this.shopName,
    required this.onChangeIconPressed,
    this.controller,
    this.errorText,
  });

  final LogoSource logo;
  final String shopName;
  final VoidCallback onChangeIconPressed;
  final TextEditingController? controller;
  final String? errorText;

  @override
  State<IconAndNamePanel> createState() => _IconAndNamePanelState();
}

class _IconAndNamePanelState extends State<IconAndNamePanel> {
  TextEditingController? _internalController;

  TextEditingController get _controller =>
      widget.controller ??
      (_internalController ??= TextEditingController(text: widget.shopName));

  @override
  void didUpdateWidget(IconAndNamePanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller == null && widget.controller != null) {
      _internalController?.dispose();
      _internalController = null;
    }
  }

  @override
  void dispose() {
    _internalController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return PanelContainer(
      borderColor: colorScheme.outline,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.l10n.iconAndShopNameTitle, style: textTheme.titleSmall),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              ShopIconSelector(
                logo: widget.logo,
                onPressed: widget.onChangeIconPressed,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: AppTextField(
                  controller: _controller,
                  labelText: context.l10n.shopNameLabel,
                  showClearButton: true,
                  errorText: widget.errorText,
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
Widget iconAndNamePanelPreview() => SizedBox(
  width: 500,
  child: IconAndNamePanel(
    shopName: "",
    logo: LogoSource.empty(),
    onChangeIconPressed: () {},
  ),
);

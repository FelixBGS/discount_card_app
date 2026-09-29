import 'package:discount_card_app/domain/models/logo_source.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:discount_card_app/ui/shared/ui/universal_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../utils/preview_utils.dart';

class ContrastIcon extends StatelessWidget {
  const ContrastIcon._({super.key, required this._child});

  factory ContrastIcon.logo(LogoSource logo, {Key? key, required double size}) {
    return ContrastIcon._(
      key: key,
      child: UniversalIcon(logo: logo, width: size, height: size),
    );
  }

  factory ContrastIcon.icon(IconData icon, {Key? key, required double size}) {
    return ContrastIcon._(
      key: key,
      child: Icon(icon, size: size),
    );
  }

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorScheme.secondary,
      ),
      child: _child,
    );
  }
}

@Preview(
  name: "Contrast Icon",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
)
Widget contrastIconPreview() => ContrastIcon.logo(
  LogoSource.network("https://cdn-icons-png.flaticon.com/512/1946/1946488.png"),
  size: AppSizes.iconMedium,
);

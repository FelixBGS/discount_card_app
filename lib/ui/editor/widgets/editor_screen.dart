import 'package:discount_card_app/domain/models/card_color.dart';
import 'package:discount_card_app/ui/editor/widgets/color_selector.dart';
import 'package:discount_card_app/ui/shared/ui/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:go_router/go_router.dart';

import '../../../l10n/l10n.dart';
import '../../shared/themes/app_dimensions.dart';
import '../../util/utils.dart';

class EditorScreen extends StatelessWidget {
  const EditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.editCardTitle),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            ColorSelector(
              titleText: context.l10n.cardColor,
              colors: CardColor.selectable,
              onColorSelected: (color) {},
              selectedColor: null,
            ),
            AppButton(
              onPressed: () {},
              text: context.l10n.save,
              backgroundColor: colorScheme.primary,
              textColor: colorScheme.onPrimary,
            ),
            AppButton(
              onPressed: () {},
              text: context.l10n.deleteCard,
              backgroundColor: colorScheme.error,
              textColor: colorScheme.onError,
            ),
          ],
        ),
      ),
    );
  }
}

@Preview(
  name: "Editor Screen",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
)
Widget editorScreenPreview() => SizedBox(width: 500, child: EditorScreen());

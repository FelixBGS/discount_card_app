import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/logo_source.dart';
import 'package:discount_card_app/ui/editor/widgets/category_and_color_panel.dart';
import 'package:discount_card_app/ui/editor/widgets/editor_app_bar.dart';
import 'package:discount_card_app/ui/editor/widgets/icon_and_name_panel.dart';
import 'package:discount_card_app/ui/shared/ui/app_button.dart';
import 'package:discount_card_app/ui/shared/ui/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../../l10n/l10n.dart';
import '../../shared/themes/app_dimensions.dart';
import '../../util/utils.dart';

class EditorScreen extends StatelessWidget {
  const EditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: EditorAppBar(),
      body: Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconAndNamePanel(
              logo: LogoSource.empty(),
              onChangeIconPressed: () {},
              onNameChanged: () {},
            ),
            SizedBox(height: AppSpacing.sm),
            CategoryAndColorPanel(
              selectedCategoryType: CardCategoryType.unknown,
              onCategoryTypeChanged: () {},
              onColorChanged: () {},
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              context.l10n.cardDescriptionLabel,
              style: textTheme.titleMedium,
            ),
            AppTextField(
              controller: TextEditingController(),
              maxLength: 200,
              minLines: 3,
              maxLines: 6,
            ),
            SizedBox(height: AppSpacing.lg),
            AppButton(
              onPressed: () {},
              text: context.l10n.save,
              backgroundColor: colorScheme.primary,
              textColor: colorScheme.onPrimary,
            ),
            SizedBox(height: AppSpacing.sm),
            AppButton(
              onPressed: () {},
              text: context.l10n.deleteCard,
              backgroundColor: Colors.transparent,
              textColor: colorScheme.error,
            ),
          ],
        ),
      ),
    );
  }
}

@Preview(
  name: "Editor Screen",
  group: "Editor Screen",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
)
Widget editorScreenPreview() => SizedBox(
  width: 600,
  height: 1000,
  child: Container(color: Color(0xFFF7F8FC), child: EditorScreen()),
);

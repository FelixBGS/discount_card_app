import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/models/card_category_ui.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:discount_card_app/ui/shared/ui/app_button.dart';
import 'package:discount_card_app/ui/shared/ui/contrast_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../util/utils.dart';

class CategoryFilterScreen extends StatefulWidget {
  const CategoryFilterScreen({super.key, required this.selectedCategory});

  final CardCategoryType selectedCategory;

  static Future<CardCategoryType?> show(
    BuildContext context, {
    required CardCategoryType selectedCategory,
  }) {
    return Navigator.of(context, rootNavigator: true).push<CardCategoryType>(
      MaterialPageRoute(
        builder: (context) =>
            CategoryFilterScreen(selectedCategory: selectedCategory),
      ),
    );
  }

  @override
  State<CategoryFilterScreen> createState() => _CategoryFilterScreenState();
}

class _CategoryFilterScreenState extends State<CategoryFilterScreen> {
  late CardCategoryType _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedCategory;
  }

  void _apply() {
    Navigator.of(context).pop(_selected);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.filtersTitle, style: textTheme.titleMedium),
        centerTitle: true,
        titleSpacing: AppSpacing.lg,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_ios, size: AppSizes.iconSmall),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.sm,
            AppSpacing.lg,
            AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(context.l10n.categoriesTitle, style: textTheme.titleMedium),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: CardCategoryType.values.length,
                  itemBuilder: (context, index) {
                    final category = CardCategoryType.values[index];
                    return _CategoryFilterTile(
                      category: category,
                      selected: _selected == category,
                      onTap: () => setState(() => _selected = category),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              AppButton(
                onPressed: _apply,
                text: context.l10n.apply,
                backgroundColor: colorScheme.primary,
                textColor: colorScheme.onPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryFilterTile extends StatelessWidget {
  const _CategoryFilterTile({
    required this.category,
    required this.selected,
    required this.onTap,
  });

  final CardCategoryType category;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: selected,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              0,
              AppSpacing.sm,
              AppSpacing.lg,
              AppSpacing.sm,
            ),
            child: Row(
              children: [
                ContrastIcon.icon(category.icon, size: AppSizes.iconSmall),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(
                    category.label(context.l10n),
                    style: textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                _SelectionMark(selected: selected),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SelectionMark extends StatelessWidget {
  const _SelectionMark({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = selected
        ? colorScheme.primary
        : colorScheme.onSecondary.withValues(alpha: 0.4);

    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? colorScheme.primary : Colors.transparent,
        border: Border.all(color: color, width: 1.6),
      ),
    );
  }
}

@Preview(
  name: "Category Filter Screen",
  group: "Editor Screen",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
)
Widget categoryFilterScreenPreview() => const SizedBox(
  width: 400,
  height: 800,
  child: CategoryFilterScreen(selectedCategory: CardCategoryType.supermarket),
);

import 'package:discount_card_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../shared/themes/app_dimensions.dart';

class EditorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EditorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppBar(
      title: Text(
        context.l10n.editCardTitle,
        style: theme.textTheme.titleLarge?.copyWith(
          color: colorScheme.onSurface,
        ),
      ),
      centerTitle: true,
      titleSpacing: AppSpacing.lg,
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsetsGeometry.directional(start: AppSpacing.lg),
        child: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios, size: AppSizes.iconMedium),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + AppSpacing.md);
}

import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/editor/state/editor_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../shared/themes/app_dimensions.dart';

class EditorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EditorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // TODO(riverpod): подписаться только на cardId из состояния редактора.
    final cardId = const EditorState().cardId;

    return AppBar(
      title: Text(
        cardId == null
            ? context.l10n.createCardTitle
            : context.l10n.editCardTitle,
        style: theme.textTheme.titleMedium,
      ),
      centerTitle: true,
      titleSpacing: AppSpacing.lg,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(Icons.arrow_back_ios, size: AppSizes.iconSmall),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

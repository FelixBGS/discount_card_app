import 'package:discount_card_app/ui/router/branches/home/editor_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../l10n/l10n.dart';
import '../../shared/themes/app_dimensions.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppBar(
      title: Text(
        context.l10n.myCardsTitle,
        style: theme.textTheme.titleLarge?.copyWith(
          color: colorScheme.onSurface,
        ),
      ),
      titleSpacing: AppSpacing.lg,
      actionsPadding: const EdgeInsets.only(right: AppSpacing.lg),
      actions: [
        IconButton(
          onPressed: null,
          icon: SvgPicture.asset(
            colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
            width: AppSizes.iconMedium,
            height: AppSizes.iconMedium,
            "assets/images/icons/ic_barcode_scanner.svg",
          ),
        ),
        IconButton(
          onPressed: () => const EditorRouteData().push(context),
          icon: const Icon(Icons.add, size: AppSizes.iconMedium),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

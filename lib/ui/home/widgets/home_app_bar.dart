import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/shared/themes/app_colors.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        context.l10n.myCardsTitle,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      titleSpacing: AppSpacing.lg,
      actionsPadding: const EdgeInsets.only(right: AppSpacing.lg),
      actions: [
        IconButton(
          onPressed: () => {},
          icon: SvgPicture.asset(
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
            width: AppSizes.iconMedium,
            height: AppSizes.iconMedium,
            "assets/images/icons/ic_barcode_scanner.svg",
          ),
        ),
        IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.add, size: AppSizes.iconMedium),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/core/themes/app_colors.dart';
import 'package:discount_card_app/ui/core/themes/app_dimensions.dart';
import 'package:discount_card_app/ui/core/ui/app_search_bar.dart';
import 'package:discount_card_app/ui/home/widgets/filter_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              width: AppSizes.iconMedium,
              height: AppSizes.iconMedium,
              "assets/images/icons/ic_barcode_scanner.svg",
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.add, size: AppSizes.iconMedium),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Column(
          spacing: AppSpacing.md,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppSearchBar(
              hintText: context.l10n.searchCardsHint,
              icon: Icons.search_rounded,
            ),
            Wrap(spacing: AppSpacing.md, children: [
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}

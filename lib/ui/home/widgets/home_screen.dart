import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/core/ui/app_search_bar.dart';
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
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        titleSpacing: 24,
        actionsPadding: const EdgeInsets.only(right: 24),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: SvgPicture.asset(
              width: 28,
              height: 28,
              "assets/images/icons/ic_barcode_scanner.svg",
            ),
          ),
          IconButton(onPressed: () => {}, icon: Icon(Icons.add, size: 28)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppSearchBar(
              hintText: context.l10n.searchCardsHint,
              icon: Icons.search_rounded,
            ),
          ],
        ),
      ),
    );
  }
}

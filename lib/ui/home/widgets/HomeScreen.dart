import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/core/ui/AppSearchBar.dart';
import 'package:flutter/material.dart';

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
          IconButton(onPressed: () => {}, icon: Icon(Icons.qr_code_scanner)),
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

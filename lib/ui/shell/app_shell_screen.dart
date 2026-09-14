import 'package:discount_card_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppShellScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppShellScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.credit_card_outlined),
            label: context.l10n.catalogNavOption,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.qr_code_scanner_outlined),
            label: context.l10n.scannerNavOption,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            label: context.l10n.settingsNavOption,
          ),
        ],
      ),
    );
  }
}

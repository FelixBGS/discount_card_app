import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/models/app_tab.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  final AppTab selectedTab;
  final ValueChanged<AppTab> onTabSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return NavigationBar(
      selectedIndex: selectedTab.index,
      onDestinationSelected: (index) {
        onTabSelected(AppTab.values[index]);
      },
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.credit_card_outlined),
          selectedIcon: const Icon(Icons.credit_card),
          label: l10n.catalogNavOption,
        ),
        NavigationDestination(
          icon: const Icon(Icons.qr_code_scanner_outlined),
          selectedIcon: const Icon(Icons.qr_code_scanner),
          label: l10n.scannerNavOption,
        ),
        NavigationDestination(
          icon: const Icon(Icons.settings_outlined),
          selectedIcon: const Icon(Icons.settings),
          label: l10n.settingsNavOption,
        ),
      ],
    );
  }
}

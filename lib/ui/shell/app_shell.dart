import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/home/cubit/home_cubit.dart';
import 'package:discount_card_app/ui/shared/ui/app_bottom_navigation_bar.dart';
import 'package:discount_card_app/ui/home/widgets/home_screen.dart';
import 'package:discount_card_app/ui/models/app_tab.dart';
import 'package:flutter/material.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  AppTab _selectedTab = AppTab.catalog;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: IndexedStack(
        index: _selectedTab.index,
        children: [
          BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeScreen(),
          ),
          _TabPlaceholder(title: l10n.scannerNavOption),
          _TabPlaceholder(title: l10n.settingsNavOption),
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        selectedTab: _selectedTab,
        onTabSelected: (tab) => setState(() => _selectedTab = tab),
      ),
    );
  }
}

class _TabPlaceholder extends StatelessWidget {
  const _TabPlaceholder({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const SizedBox.shrink(),
    );
  }
}

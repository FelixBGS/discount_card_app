import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/ui/router/branches/home/details_route.dart';
import 'package:discount_card_app/ui/router/branches/home/home_route.dart';
import 'package:discount_card_app/ui/router/branches/scanner/scanner.dart';
import 'package:discount_card_app/ui/router/branches/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../editor/state/editor_args.dart';
import '../editor/widgets/editor_screen.dart';
import '../shell/app_shell_screen.dart';

part 'app_router.g.dart';
part 'branches/editor/editor_route.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: "/home",
  routes: $appRoutes,
);

@TypedStatefulShellRoute<AppShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeBranchData>(
      routes: [
        TypedGoRoute<HomeRouteData>(
          path: "/home",
          routes: [TypedGoRoute<DetailsRouteData>(path: "details/:cardId")],
        ),
      ],
    ),
    TypedStatefulShellBranch<ScannerBranchData>(
      routes: [TypedGoRoute<ScannerRouteData>(path: "/scanner")],
    ),
    TypedStatefulShellBranch<SettingBranchData>(
      routes: [TypedGoRoute<SettingsRouteData>(path: "/settings")],
    ),
  ],
)
class AppShellRouteData extends StatefulShellRouteData {
  const AppShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return AppShellScreen(navigationShell: navigationShell);
  }

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) {
    return Stack(
      children: List.generate(children.length, (index) {
        final isActive = index == navigationShell.currentIndex;

        final branch = navigationShell.route.branches[index];
        final isCameraTab = branch.initialLocation == '/scanner';

        if (isCameraTab) {
          return isActive ? children[index] : const SizedBox.shrink();
        }

        return Offstage(
          offstage: !isActive,
          child: TickerMode(enabled: isActive, child: children[index]),
        );
      }),
    );
  }
}

class HomeBranchData extends StatefulShellBranchData {
  const HomeBranchData();
}

class ScannerBranchData extends StatefulShellBranchData {
  const ScannerBranchData();
}

class SettingBranchData extends StatefulShellBranchData {
  const SettingBranchData();
}

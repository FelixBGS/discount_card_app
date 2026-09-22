import 'package:discount_card_app/ui/editor/widgets/editor_screen.dart';
import 'package:discount_card_app/ui/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditorRouteData extends GoRouteData with $EditorRouteData {
  const EditorRouteData();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) => const EditorPage();
}

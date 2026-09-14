import 'package:discount_card_app/ui/router/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class DetailsRouteData extends GoRouteData with $DetailsRouteData {
  const DetailsRouteData();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Text("Not implemented");
}

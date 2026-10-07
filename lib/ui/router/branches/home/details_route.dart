import 'package:discount_card_app/ui/details/widgets/details_screen.dart';
import 'package:discount_card_app/ui/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsRouteData extends GoRouteData with $DetailsRouteData {
  const DetailsRouteData({required this.cardId});

  final String cardId;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      DetailsScreen(cardId: cardId);
}

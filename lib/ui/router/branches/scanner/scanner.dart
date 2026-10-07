import 'package:discount_card_app/ui/scanner/widgets/scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app_router.dart';

class ScannerRouteData extends GoRouteData with $ScannerRouteData {
  const ScannerRouteData();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ScannerScreen();
}

import 'package:discount_card_app/core/di/injection.dart';
import 'package:discount_card_app/ui/home/cubit/home_cubit.dart';
import 'package:discount_card_app/ui/home/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app_router.dart';

class HomeRouteData extends GoRouteData with $HomeRouteData {
  const HomeRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
    create: (context) => HomeCubit(getIt())..init(),
    child: const HomeScreen(),
  );
}

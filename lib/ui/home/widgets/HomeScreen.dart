import 'package:discount_card_app/ui/core/ui/AppSearchBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: AppSearchBar()));
  }
}

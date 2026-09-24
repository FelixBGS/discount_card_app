import 'dart:convert';

import 'package:discount_card_app/domain/models/card_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemCategory {
  const SystemCategory({
    required this.id,
    required this.name,
    required this.icon,
  });

  final String id;
  final String name;
  final IconData icon;

  CardCategory get category => CardCategory(id);
}

class CategoryCatalog {
  CategoryCatalog(this._categories);

  static const assetPath = 'assets/data/categories.json';

  static CategoryCatalog? current;

  final List<SystemCategory> _categories;

  List<CardCategory> get categories => [
    for (final category in _categories) category.category,
  ];

  String? nameOf(CardCategory category) {
    for (final item in _categories) {
      if (item.id == category.id) return item.name;
    }
    return null;
  }

  IconData iconOf(CardCategory category) {
    for (final item in _categories) {
      if (item.id == category.id) return item.icon;
    }
    return Icons.category_outlined;
  }

  static Future<CategoryCatalog> load() async {
    final raw = await rootBundle.loadString(assetPath);
    final decoded = jsonDecode(raw);
    if (decoded is! List) {
      throw const FormatException('Categories file must contain an array');
    }

    final seenIds = <String>{};
    final categories = <SystemCategory>[];
    for (final item in decoded) {
      if (item is! Map) {
        throw const FormatException('Category entry must be an object');
      }
      final id = item['id'];
      final name = item['name'];
      final iconName = item['icon'];
      if (id is! String || id.isEmpty || name is! String || name.isEmpty) {
        throw const FormatException('Category id and name are required');
      }
      if (iconName is! String || iconName.isEmpty) {
        throw const FormatException('Category icon is required');
      }
      if (!seenIds.add(id)) {
        throw FormatException('Duplicate category id: $id');
      }
      categories.add(
        SystemCategory(
          id: id,
          name: name,
          icon: _icons[iconName] ?? Icons.category_outlined,
        ),
      );
    }

    return CategoryCatalog(categories);
  }
}

const _icons = <String, IconData>{
  'shopping_cart': Icons.shopping_cart_outlined,
  'checkroom': Icons.checkroom,
  'local_cafe': Icons.local_cafe,
  'local_pharmacy': Icons.local_pharmacy,
  'computer': Icons.computer,
  'local_laundry_service': Icons.local_laundry_service,
  'sports_esports': Icons.sports_esports,
};

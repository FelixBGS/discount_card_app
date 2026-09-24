import 'package:discount_card_app/data/database/converters/barcode_format_converter.dart';
import 'package:discount_card_app/data/database/converters/card_category_converter.dart';
import 'package:discount_card_app/data/database/converters/card_color_converter.dart';
import 'package:discount_card_app/data/database/drift_database.steps.dart';
import 'package:discount_card_app/data/database/tables/discount_card_scheme.dart';
import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/domain/models/card_category.dart';
import 'package:discount_card_app/domain/models/card_color.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/common.dart';

import 'daos/discount_card_dao.dart';

part 'drift_database.g.dart';

const String _databaseName = 'discount_cards';

@DriftDatabase(tables: [DiscountCardScheme], daos: [DiscountCardDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: stepByStep(
        from1To2: (m, schema) async {
          await m.addColumn(
            schema.discountCardScheme,
            schema.discountCardScheme.shopNameSearch,
          );
          await customStatement(
            'UPDATE discount_card_scheme SET shop_name_search = unicode_lower(shop_name)',
          );
        },
      ),
    );
  }

  static QueryExecutor _openConnection() => driftDatabase(
    name: _databaseName,
    native: DriftNativeOptions(
      databaseDirectory: getApplicationSupportDirectory,
      setup: (db) {
        db.createFunction(
          functionName: 'unicode_lower',
          argumentCount: const AllowedArgumentCount(1),
          function: (args) {
            final value = args.first;
            if (value == null) return null;
            return value.toString().toLowerCase();
          },
        );
      },
    ),
  );
}

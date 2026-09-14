// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $DiscountCardSchemeTable extends DiscountCardScheme
    with TableInfo<$DiscountCardSchemeTable, DiscountCardEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiscountCardSchemeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shopNameMeta = const VerificationMeta(
    'shopName',
  );
  @override
  late final GeneratedColumn<String> shopName = GeneratedColumn<String>(
    'shop_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shopNameSearchMeta = const VerificationMeta(
    'shopNameSearch',
  );
  @override
  late final GeneratedColumn<String> shopNameSearch = GeneratedColumn<String>(
    'shop_name_search',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<CardCategoryType, String>
  category =
      GeneratedColumn<String>(
        'category',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<CardCategoryType>(
        $DiscountCardSchemeTable.$convertercategory,
      );
  @override
  late final GeneratedColumnWithTypeConverter<CardColor, String> color =
      GeneratedColumn<String>(
        'color',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<CardColor>($DiscountCardSchemeTable.$convertercolor);
  static const VerificationMeta _barcodeMeta = const VerificationMeta(
    'barcode',
  );
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
    'barcode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<BarcodeFormat, String>
  barcodeFormat =
      GeneratedColumn<String>(
        'barcode_format',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<BarcodeFormat>(
        $DiscountCardSchemeTable.$converterbarcodeFormat,
      );
  static const VerificationMeta _logoUrlMeta = const VerificationMeta(
    'logoUrl',
  );
  @override
  late final GeneratedColumn<String> logoUrl = GeneratedColumn<String>(
    'logo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    shopName,
    shopNameSearch,
    category,
    color,
    barcode,
    barcodeFormat,
    logoUrl,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'discount_card_scheme';
  @override
  VerificationContext validateIntegrity(
    Insertable<DiscountCardEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('shop_name')) {
      context.handle(
        _shopNameMeta,
        shopName.isAcceptableOrUnknown(data['shop_name']!, _shopNameMeta),
      );
    } else if (isInserting) {
      context.missing(_shopNameMeta);
    }
    if (data.containsKey('shop_name_search')) {
      context.handle(
        _shopNameSearchMeta,
        shopNameSearch.isAcceptableOrUnknown(
          data['shop_name_search']!,
          _shopNameSearchMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_shopNameSearchMeta);
    }
    if (data.containsKey('barcode')) {
      context.handle(
        _barcodeMeta,
        barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta),
      );
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (data.containsKey('logo_url')) {
      context.handle(
        _logoUrlMeta,
        logoUrl.isAcceptableOrUnknown(data['logo_url']!, _logoUrlMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DiscountCardEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DiscountCardEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      shopName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shop_name'],
      )!,
      shopNameSearch: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shop_name_search'],
      )!,
      category: $DiscountCardSchemeTable.$convertercategory.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}category'],
        )!,
      ),
      color: $DiscountCardSchemeTable.$convertercolor.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}color'],
        )!,
      ),
      barcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcode'],
      )!,
      barcodeFormat: $DiscountCardSchemeTable.$converterbarcodeFormat.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}barcode_format'],
        )!,
      ),
      logoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_url'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $DiscountCardSchemeTable createAlias(String alias) {
    return $DiscountCardSchemeTable(attachedDatabase, alias);
  }

  static TypeConverter<CardCategoryType, String> $convertercategory =
      const CardCategoryConverter();
  static TypeConverter<CardColor, String> $convertercolor =
      const CardColorConverter();
  static TypeConverter<BarcodeFormat, String> $converterbarcodeFormat =
      const BarcodeFormatConverter();
}

class DiscountCardEntity extends DataClass
    implements Insertable<DiscountCardEntity> {
  final String id;
  final String shopName;
  final String shopNameSearch;
  final CardCategoryType category;
  final CardColor color;
  final String barcode;
  final BarcodeFormat barcodeFormat;
  final String? logoUrl;
  final String? description;
  const DiscountCardEntity({
    required this.id,
    required this.shopName,
    required this.shopNameSearch,
    required this.category,
    required this.color,
    required this.barcode,
    required this.barcodeFormat,
    this.logoUrl,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['shop_name'] = Variable<String>(shopName);
    map['shop_name_search'] = Variable<String>(shopNameSearch);
    {
      map['category'] = Variable<String>(
        $DiscountCardSchemeTable.$convertercategory.toSql(category),
      );
    }
    {
      map['color'] = Variable<String>(
        $DiscountCardSchemeTable.$convertercolor.toSql(color),
      );
    }
    map['barcode'] = Variable<String>(barcode);
    {
      map['barcode_format'] = Variable<String>(
        $DiscountCardSchemeTable.$converterbarcodeFormat.toSql(barcodeFormat),
      );
    }
    if (!nullToAbsent || logoUrl != null) {
      map['logo_url'] = Variable<String>(logoUrl);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  DiscountCardSchemeCompanion toCompanion(bool nullToAbsent) {
    return DiscountCardSchemeCompanion(
      id: Value(id),
      shopName: Value(shopName),
      shopNameSearch: Value(shopNameSearch),
      category: Value(category),
      color: Value(color),
      barcode: Value(barcode),
      barcodeFormat: Value(barcodeFormat),
      logoUrl: logoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(logoUrl),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory DiscountCardEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiscountCardEntity(
      id: serializer.fromJson<String>(json['id']),
      shopName: serializer.fromJson<String>(json['shopName']),
      shopNameSearch: serializer.fromJson<String>(json['shopNameSearch']),
      category: serializer.fromJson<CardCategoryType>(json['category']),
      color: serializer.fromJson<CardColor>(json['color']),
      barcode: serializer.fromJson<String>(json['barcode']),
      barcodeFormat: serializer.fromJson<BarcodeFormat>(json['barcodeFormat']),
      logoUrl: serializer.fromJson<String?>(json['logoUrl']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'shopName': serializer.toJson<String>(shopName),
      'shopNameSearch': serializer.toJson<String>(shopNameSearch),
      'category': serializer.toJson<CardCategoryType>(category),
      'color': serializer.toJson<CardColor>(color),
      'barcode': serializer.toJson<String>(barcode),
      'barcodeFormat': serializer.toJson<BarcodeFormat>(barcodeFormat),
      'logoUrl': serializer.toJson<String?>(logoUrl),
      'description': serializer.toJson<String?>(description),
    };
  }

  DiscountCardEntity copyWith({
    String? id,
    String? shopName,
    String? shopNameSearch,
    CardCategoryType? category,
    CardColor? color,
    String? barcode,
    BarcodeFormat? barcodeFormat,
    Value<String?> logoUrl = const Value.absent(),
    Value<String?> description = const Value.absent(),
  }) => DiscountCardEntity(
    id: id ?? this.id,
    shopName: shopName ?? this.shopName,
    shopNameSearch: shopNameSearch ?? this.shopNameSearch,
    category: category ?? this.category,
    color: color ?? this.color,
    barcode: barcode ?? this.barcode,
    barcodeFormat: barcodeFormat ?? this.barcodeFormat,
    logoUrl: logoUrl.present ? logoUrl.value : this.logoUrl,
    description: description.present ? description.value : this.description,
  );
  DiscountCardEntity copyWithCompanion(DiscountCardSchemeCompanion data) {
    return DiscountCardEntity(
      id: data.id.present ? data.id.value : this.id,
      shopName: data.shopName.present ? data.shopName.value : this.shopName,
      shopNameSearch: data.shopNameSearch.present
          ? data.shopNameSearch.value
          : this.shopNameSearch,
      category: data.category.present ? data.category.value : this.category,
      color: data.color.present ? data.color.value : this.color,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      barcodeFormat: data.barcodeFormat.present
          ? data.barcodeFormat.value
          : this.barcodeFormat,
      logoUrl: data.logoUrl.present ? data.logoUrl.value : this.logoUrl,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DiscountCardEntity(')
          ..write('id: $id, ')
          ..write('shopName: $shopName, ')
          ..write('shopNameSearch: $shopNameSearch, ')
          ..write('category: $category, ')
          ..write('color: $color, ')
          ..write('barcode: $barcode, ')
          ..write('barcodeFormat: $barcodeFormat, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    shopName,
    shopNameSearch,
    category,
    color,
    barcode,
    barcodeFormat,
    logoUrl,
    description,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiscountCardEntity &&
          other.id == this.id &&
          other.shopName == this.shopName &&
          other.shopNameSearch == this.shopNameSearch &&
          other.category == this.category &&
          other.color == this.color &&
          other.barcode == this.barcode &&
          other.barcodeFormat == this.barcodeFormat &&
          other.logoUrl == this.logoUrl &&
          other.description == this.description);
}

class DiscountCardSchemeCompanion extends UpdateCompanion<DiscountCardEntity> {
  final Value<String> id;
  final Value<String> shopName;
  final Value<String> shopNameSearch;
  final Value<CardCategoryType> category;
  final Value<CardColor> color;
  final Value<String> barcode;
  final Value<BarcodeFormat> barcodeFormat;
  final Value<String?> logoUrl;
  final Value<String?> description;
  final Value<int> rowid;
  const DiscountCardSchemeCompanion({
    this.id = const Value.absent(),
    this.shopName = const Value.absent(),
    this.shopNameSearch = const Value.absent(),
    this.category = const Value.absent(),
    this.color = const Value.absent(),
    this.barcode = const Value.absent(),
    this.barcodeFormat = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DiscountCardSchemeCompanion.insert({
    required String id,
    required String shopName,
    required String shopNameSearch,
    required CardCategoryType category,
    required CardColor color,
    required String barcode,
    required BarcodeFormat barcodeFormat,
    this.logoUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       shopName = Value(shopName),
       shopNameSearch = Value(shopNameSearch),
       category = Value(category),
       color = Value(color),
       barcode = Value(barcode),
       barcodeFormat = Value(barcodeFormat);
  static Insertable<DiscountCardEntity> custom({
    Expression<String>? id,
    Expression<String>? shopName,
    Expression<String>? shopNameSearch,
    Expression<String>? category,
    Expression<String>? color,
    Expression<String>? barcode,
    Expression<String>? barcodeFormat,
    Expression<String>? logoUrl,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shopName != null) 'shop_name': shopName,
      if (shopNameSearch != null) 'shop_name_search': shopNameSearch,
      if (category != null) 'category': category,
      if (color != null) 'color': color,
      if (barcode != null) 'barcode': barcode,
      if (barcodeFormat != null) 'barcode_format': barcodeFormat,
      if (logoUrl != null) 'logo_url': logoUrl,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DiscountCardSchemeCompanion copyWith({
    Value<String>? id,
    Value<String>? shopName,
    Value<String>? shopNameSearch,
    Value<CardCategoryType>? category,
    Value<CardColor>? color,
    Value<String>? barcode,
    Value<BarcodeFormat>? barcodeFormat,
    Value<String?>? logoUrl,
    Value<String?>? description,
    Value<int>? rowid,
  }) {
    return DiscountCardSchemeCompanion(
      id: id ?? this.id,
      shopName: shopName ?? this.shopName,
      shopNameSearch: shopNameSearch ?? this.shopNameSearch,
      category: category ?? this.category,
      color: color ?? this.color,
      barcode: barcode ?? this.barcode,
      barcodeFormat: barcodeFormat ?? this.barcodeFormat,
      logoUrl: logoUrl ?? this.logoUrl,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (shopName.present) {
      map['shop_name'] = Variable<String>(shopName.value);
    }
    if (shopNameSearch.present) {
      map['shop_name_search'] = Variable<String>(shopNameSearch.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(
        $DiscountCardSchemeTable.$convertercategory.toSql(category.value),
      );
    }
    if (color.present) {
      map['color'] = Variable<String>(
        $DiscountCardSchemeTable.$convertercolor.toSql(color.value),
      );
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (barcodeFormat.present) {
      map['barcode_format'] = Variable<String>(
        $DiscountCardSchemeTable.$converterbarcodeFormat.toSql(
          barcodeFormat.value,
        ),
      );
    }
    if (logoUrl.present) {
      map['logo_url'] = Variable<String>(logoUrl.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiscountCardSchemeCompanion(')
          ..write('id: $id, ')
          ..write('shopName: $shopName, ')
          ..write('shopNameSearch: $shopNameSearch, ')
          ..write('category: $category, ')
          ..write('color: $color, ')
          ..write('barcode: $barcode, ')
          ..write('barcodeFormat: $barcodeFormat, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DiscountCardSchemeTable discountCardScheme =
      $DiscountCardSchemeTable(this);
  late final DiscountCardDao discountCardDao = DiscountCardDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [discountCardScheme];
}

typedef $$DiscountCardSchemeTableCreateCompanionBuilder =
    DiscountCardSchemeCompanion Function({
      required String id,
      required String shopName,
      required String shopNameSearch,
      required CardCategoryType category,
      required CardColor color,
      required String barcode,
      required BarcodeFormat barcodeFormat,
      Value<String?> logoUrl,
      Value<String?> description,
      Value<int> rowid,
    });
typedef $$DiscountCardSchemeTableUpdateCompanionBuilder =
    DiscountCardSchemeCompanion Function({
      Value<String> id,
      Value<String> shopName,
      Value<String> shopNameSearch,
      Value<CardCategoryType> category,
      Value<CardColor> color,
      Value<String> barcode,
      Value<BarcodeFormat> barcodeFormat,
      Value<String?> logoUrl,
      Value<String?> description,
      Value<int> rowid,
    });

class $$DiscountCardSchemeTableFilterComposer
    extends Composer<_$AppDatabase, $DiscountCardSchemeTable> {
  $$DiscountCardSchemeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shopName => $composableBuilder(
    column: $table.shopName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shopNameSearch => $composableBuilder(
    column: $table.shopNameSearch,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CardCategoryType, CardCategoryType, String>
  get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<CardColor, CardColor, String> get color =>
      $composableBuilder(
        column: $table.color,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<BarcodeFormat, BarcodeFormat, String>
  get barcodeFormat => $composableBuilder(
    column: $table.barcodeFormat,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DiscountCardSchemeTableOrderingComposer
    extends Composer<_$AppDatabase, $DiscountCardSchemeTable> {
  $$DiscountCardSchemeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shopName => $composableBuilder(
    column: $table.shopName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shopNameSearch => $composableBuilder(
    column: $table.shopNameSearch,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barcodeFormat => $composableBuilder(
    column: $table.barcodeFormat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DiscountCardSchemeTableAnnotationComposer
    extends Composer<_$AppDatabase, $DiscountCardSchemeTable> {
  $$DiscountCardSchemeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get shopName =>
      $composableBuilder(column: $table.shopName, builder: (column) => column);

  GeneratedColumn<String> get shopNameSearch => $composableBuilder(
    column: $table.shopNameSearch,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<CardCategoryType, String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CardColor, String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumnWithTypeConverter<BarcodeFormat, String> get barcodeFormat =>
      $composableBuilder(
        column: $table.barcodeFormat,
        builder: (column) => column,
      );

  GeneratedColumn<String> get logoUrl =>
      $composableBuilder(column: $table.logoUrl, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $$DiscountCardSchemeTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DiscountCardSchemeTable,
          DiscountCardEntity,
          $$DiscountCardSchemeTableFilterComposer,
          $$DiscountCardSchemeTableOrderingComposer,
          $$DiscountCardSchemeTableAnnotationComposer,
          $$DiscountCardSchemeTableCreateCompanionBuilder,
          $$DiscountCardSchemeTableUpdateCompanionBuilder,
          (
            DiscountCardEntity,
            BaseReferences<
              _$AppDatabase,
              $DiscountCardSchemeTable,
              DiscountCardEntity
            >,
          ),
          DiscountCardEntity,
          PrefetchHooks Function()
        > {
  $$DiscountCardSchemeTableTableManager(
    _$AppDatabase db,
    $DiscountCardSchemeTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiscountCardSchemeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DiscountCardSchemeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DiscountCardSchemeTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> shopName = const Value.absent(),
                Value<String> shopNameSearch = const Value.absent(),
                Value<CardCategoryType> category = const Value.absent(),
                Value<CardColor> color = const Value.absent(),
                Value<String> barcode = const Value.absent(),
                Value<BarcodeFormat> barcodeFormat = const Value.absent(),
                Value<String?> logoUrl = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DiscountCardSchemeCompanion(
                id: id,
                shopName: shopName,
                shopNameSearch: shopNameSearch,
                category: category,
                color: color,
                barcode: barcode,
                barcodeFormat: barcodeFormat,
                logoUrl: logoUrl,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String shopName,
                required String shopNameSearch,
                required CardCategoryType category,
                required CardColor color,
                required String barcode,
                required BarcodeFormat barcodeFormat,
                Value<String?> logoUrl = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DiscountCardSchemeCompanion.insert(
                id: id,
                shopName: shopName,
                shopNameSearch: shopNameSearch,
                category: category,
                color: color,
                barcode: barcode,
                barcodeFormat: barcodeFormat,
                logoUrl: logoUrl,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DiscountCardSchemeTable, DiscountCardEntity>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $DiscountCardSchemeTable,
                    DiscountCardEntity
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DiscountCardSchemeTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DiscountCardSchemeTable,
      DiscountCardEntity,
      $$DiscountCardSchemeTableFilterComposer,
      $$DiscountCardSchemeTableOrderingComposer,
      $$DiscountCardSchemeTableAnnotationComposer,
      $$DiscountCardSchemeTableCreateCompanionBuilder,
      $$DiscountCardSchemeTableUpdateCompanionBuilder,
      (
        DiscountCardEntity,
        BaseReferences<
          _$AppDatabase,
          $DiscountCardSchemeTable,
          DiscountCardEntity
        >,
      ),
      DiscountCardEntity,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DiscountCardSchemeTableTableManager get discountCardScheme =>
      $$DiscountCardSchemeTableTableManager(_db, _db.discountCardScheme);
}

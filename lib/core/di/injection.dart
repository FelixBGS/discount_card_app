import 'package:discount_card_app/data/database/drift_database.dart';
import 'package:discount_card_app/data/repository/discount_card_repository_impl.dart';
import 'package:discount_card_app/domain/repository/discount_card_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

final discountCardRepositoryProvider = Provider<DiscountCardRepository>((ref) {
  final dao = ref.read(appDatabaseProvider).discountCardDao;
  return DiscountCardRepositoryImpl(dao);
});

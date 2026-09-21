import 'package:discount_card_app/data/database/daos/discount_card_dao.dart';
import 'package:discount_card_app/data/database/drift_database.dart';
import 'package:discount_card_app/data/repository/discount_card_repository_impl.dart';
import 'package:discount_card_app/domain/repository/discount_card_repository.dart';
import 'package:get_it/get_it.dart';

import '../../data/service/logo_file_service_impl.dart';
import '../../domain/service/logo_file_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  getIt.registerLazySingleton<DiscountCardDao>(
    () => DiscountCardDao(getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<DiscountCardRepository>(
    () => DiscountCardRepositoryImpl(getIt<DiscountCardDao>()),
  );

  getIt.registerLazySingleton<LogoFileService>(() => LogoFileServiceImpl());
}

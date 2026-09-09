import 'package:discount_card_app/data/repository/discount_card_repository_impl.dart';
import 'package:discount_card_app/domain/repository/discount_card_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<DiscountCardRepository>(
    () => DiscountCardRepositoryImpl(),
  );
}

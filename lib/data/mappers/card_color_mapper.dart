import 'package:discount_card_app/domain/models/card_color.dart';

import '../models/api/card_color_api.dart';

abstract final class CardColorMapper {
  static CardColor fromApi(String value) => switch (value) {
    CardColorApi.red => CardColor.red,
    CardColorApi.orange => CardColor.orange,
    CardColorApi.yellow => CardColor.yellow,
    CardColorApi.green => CardColor.green,
    CardColorApi.blue => CardColor.blue,
    CardColorApi.purple => CardColor.purple,
    _ => CardColor.unknown,
  };

  static String toApi(CardColor value) => switch (value) {
    CardColor.red => CardColorApi.red,
    CardColor.orange => CardColorApi.orange,
    CardColor.yellow => CardColorApi.yellow,
    CardColor.green => CardColorApi.green,
    CardColor.blue => CardColorApi.blue,
    CardColor.purple => CardColorApi.purple,
    CardColor.unknown => CardColorApi.unknown,
  };
}

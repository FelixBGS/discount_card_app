import 'package:discount_card_app/data/models/card_color_api.dart';
import 'package:discount_card_app/domain/models/card_color.dart';

abstract final class CardColorMapper {
  static CardColor fromApi(String value) => switch (value) {
    CardColorApi.red => CardColor.red,
    CardColorApi.orange => CardColor.orange,
    CardColorApi.yellow => CardColor.yellow,
    CardColorApi.green => CardColor.green,
    CardColorApi.blue => CardColor.blue,
    CardColorApi.darkBlue => CardColor.darkBlue,
    CardColorApi.purple => CardColor.purple,
    _ => CardColor.unknown,
  };

  static String toApi(CardColor value) => switch (value) {
    CardColor.red => CardColorApi.red,
    CardColor.orange => CardColorApi.orange,
    CardColor.yellow => CardColorApi.yellow,
    CardColor.green => CardColorApi.green,
    CardColor.blue => CardColorApi.blue,
    CardColor.darkBlue => CardColorApi.darkBlue,
    CardColor.purple => CardColorApi.purple,
    CardColor.unknown => CardColorApi.unknown,
  };
}

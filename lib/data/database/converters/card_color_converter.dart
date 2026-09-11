import 'package:drift/drift.dart';

import '../../../domain/models/card_color.dart';

class CardColorConverter extends TypeConverter<CardColor, String> {
  const CardColorConverter();

  @override
  CardColor fromSql(String fromDb) => switch (fromDb) {
    "RED" => CardColor.red,
    "ORANGE" => CardColor.orange,
    "YELLOW" => CardColor.yellow,
    "GREEN" => CardColor.green,
    "BLUE" => CardColor.blue,
    "DARK_BLUE" => CardColor.darkBlue,
    "PURPLE" => CardColor.purple,
    _ => CardColor.unknown,
  };

  @override
  String toSql(CardColor value) => switch (value) {
    CardColor.red => "RED",
    CardColor.orange => "ORANGE",
    CardColor.yellow => "YELLOW",
    CardColor.green => "GREEN",
    CardColor.blue => "BLUE",
    CardColor.darkBlue => "DARK_BLUE",
    CardColor.purple => "PURPLE",
    CardColor.unknown => "UNKNOWN",
  };
}
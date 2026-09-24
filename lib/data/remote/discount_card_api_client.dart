import 'dart:convert';

import 'package:discount_card_app/data/mappers/discount_card_mapper.dart';
import 'package:discount_card_app/domain/models/discount_card.dart';
import 'package:http/http.dart' as http;

class DiscountCardApiClient {
  DiscountCardApiClient(this._client, {this.seedUrl = defaultSeedUrl});

  static const defaultSeedUrl = 'http://127.0.0.1:8080/cards.json';

  final http.Client _client;
  final String seedUrl;

  Future<List<DiscountCard>> fetchSeedCards() async {
    final response = await _client.get(Uri.parse(seedUrl));
    if (response.statusCode != 200) {
      throw HttpException('Seed request failed: ${response.statusCode}');
    }
    final decoded = jsonDecode(response.body);
    if (decoded is! List) {
      throw const FormatException('Seed response must be an array');
    }
    return [
      for (final item in decoded)
        if (item is Map<String, dynamic>)
          DiscountCardMapper.fromJson(item)
        else if (item is Map)
          DiscountCardMapper.fromJson(Map<String, dynamic>.from(item))
        else
          throw const FormatException('Seed card must be an object'),
    ];
  }
}

class HttpException implements Exception {
  HttpException(this.message);

  final String message;

  @override
  String toString() => message;
}

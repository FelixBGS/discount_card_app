class DiscountCardApi {
  const DiscountCardApi({
    required this.id,
    required this.shopName,
    required this.category,
    required this.color,
    required this.barcode,
    this.barcodeFormat,
    this.logoUrl,
    this.description,
  });

  final String id;
  final String shopName;
  final String category;
  final String color;
  final String barcode;
  final String? barcodeFormat;
  final String? logoUrl;
  final String? description;

  factory DiscountCardApi.fromJson(Map<String, dynamic> json) {
    return DiscountCardApi(
      id: json['id'] as String,
      shopName: json['name'] as String,
      category: json['category'] as String,
      color: json['color'] as String,
      barcode: json['barcode'] as String,
      barcodeFormat: json['barcodeFormat'] as String?,
      logoUrl: json['logoUrl'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': shopName,
      'category': category,
      'color': color,
      'barcode': barcode,
      'barcodeFormat': barcodeFormat,
      'logoUrl': logoUrl,
      'description': description,
    };
  }
}

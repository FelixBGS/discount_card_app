class CardCategory {
  const CardCategory(this.id);

  final String id;

  static const unknown = CardCategory('UNKNOWN');

  static CardCategory fromId(String? id) {
    if (id == null || id.isEmpty) return unknown;
    return CardCategory(id);
  }

  @override
  bool operator ==(Object other) => other is CardCategory && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

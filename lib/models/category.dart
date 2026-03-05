class Category {
  final String id;
  final String nameEn;
  final String nameAm;
  final String? iconAsset;
  final String? colorHex;
  final int orderIndex;

  Category({
    required this.id,
    required this.nameEn,
    required this.nameAm,
    this.iconAsset,
    this.colorHex,
    this.orderIndex = 0,
  });

  String getName(String locale) => locale == 'am' ? nameAm : nameEn;
}

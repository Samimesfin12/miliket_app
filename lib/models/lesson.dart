class Lesson {
  final String id;
  final String categoryId;
  final String titleEn;
  final String titleAm;
  final String? descriptionEn;
  final String? descriptionAm;
  final String? videoUrl;
  final String? thumbnailUrl;
  final int orderIndex;

  Lesson({
    required this.id,
    required this.categoryId,
    required this.titleEn,
    required this.titleAm,
    this.descriptionEn,
    this.descriptionAm,
    this.videoUrl,
    this.thumbnailUrl,
    this.orderIndex = 0,
  });

  String getTitle(String locale) =>
      locale == 'am' ? titleAm : titleEn;

  String getDescription(String locale) =>
      (locale == 'am' ? descriptionAm : descriptionEn) ?? '';
}

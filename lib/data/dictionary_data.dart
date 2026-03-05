class SignEntry {
  final String id;
  final String wordEn;
  final String wordAm;
  final String? videoUrl;
  final String? imageUrl;
  final String categoryId;

  SignEntry({
    required this.id,
    required this.wordEn,
    required this.wordAm,
    this.videoUrl,
    this.imageUrl,
    required this.categoryId,
  });
}

class DictionaryData {
  static final List<SignEntry> signs = [
    SignEntry(id: 'hello', wordEn: 'Hello', wordAm: 'ሰላም', categoryId: 'greetings'),
    SignEntry(id: 'goodbye', wordEn: 'Goodbye', wordAm: 'ቻይ', categoryId: 'greetings'),
    SignEntry(id: 'thank-you', wordEn: 'Thank You', wordAm: 'አመሰግናለሁ', categoryId: 'greetings'),
    SignEntry(id: 'mother', wordEn: 'Mother', wordAm: 'እናት', categoryId: 'family'),
    SignEntry(id: 'father', wordEn: 'Father', wordAm: 'አባት', categoryId: 'family'),
    SignEntry(id: 'injera', wordEn: 'Injera', wordAm: 'እንጀራ', categoryId: 'food'),
    SignEntry(id: 'coffee', wordEn: 'Coffee', wordAm: 'ቡና', categoryId: 'food'),
    SignEntry(id: 'water', wordEn: 'Water', wordAm: 'ውሃ', categoryId: 'food'),
    SignEntry(id: 'help', wordEn: 'Help', wordAm: 'እርዳታ', categoryId: 'everyday'),
  ];
}

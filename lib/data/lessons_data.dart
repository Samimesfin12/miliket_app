import '../models/lesson.dart';
import '../models/category.dart';

class LessonsData {
  static final List<Category> categories = [
    Category(
      id: 'greetings',
      nameEn: 'Greetings',
      nameAm: 'ተሰብሳቢ',
      orderIndex: 0,
    ),
    Category(
      id: 'family',
      nameEn: 'Family',
      nameAm: 'ቤተሰብ',
      orderIndex: 1,
    ),
    Category(
      id: 'food',
      nameEn: 'Food',
      nameAm: 'ምግብ',
      orderIndex: 2,
    ),
    Category(
      id: 'numbers',
      nameEn: 'Numbers',
      nameAm: 'ቁጥሮች',
      orderIndex: 3,
    ),
    Category(
      id: 'colors',
      nameEn: 'Colors',
      nameAm: 'ቀለሞች',
      orderIndex: 4,
    ),
    Category(
      id: 'everyday',
      nameEn: 'Everyday',
      nameAm: 'ዕለታዊ',
      orderIndex: 5,
    ),
  ];

  static final List<Lesson> lessons = [
    // Greetings
    Lesson(
      id: 'greeting-hello',
      categoryId: 'greetings',
      titleEn: 'Hello',
      titleAm: 'ሰላም',
      descriptionEn: 'Basic greeting in Ethiopian Sign Language',
      descriptionAm: 'የኢትዮጵያ ምልክት ቋንቋ መሰረታዊ ተሰብሳቢ',
      videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      orderIndex: 0,
    ),
    Lesson(
      id: 'greeting-goodbye',
      categoryId: 'greetings',
      titleEn: 'Goodbye',
      titleAm: 'ቻይ',
      orderIndex: 1,
    ),
    Lesson(
      id: 'greeting-thank-you',
      categoryId: 'greetings',
      titleEn: 'Thank You',
      titleAm: 'አመሰግናለሁ',
      orderIndex: 2,
    ),
    // Family
    Lesson(
      id: 'family-mother',
      categoryId: 'family',
      titleEn: 'Mother',
      titleAm: 'እናት',
      orderIndex: 0,
    ),
    Lesson(
      id: 'family-father',
      categoryId: 'family',
      titleEn: 'Father',
      titleAm: 'አባት',
      orderIndex: 1,
    ),
    Lesson(
      id: 'family-sibling',
      categoryId: 'family',
      titleEn: 'Sibling',
      titleAm: 'ልጅ',
      orderIndex: 2,
    ),
    // Food - culturally relevant
    Lesson(
      id: 'food-injera',
      categoryId: 'food',
      titleEn: 'Injera',
      titleAm: 'እንጀራ',
      descriptionEn: 'Traditional Ethiopian flatbread',
      orderIndex: 0,
    ),
    Lesson(
      id: 'food-coffee',
      categoryId: 'food',
      titleEn: 'Coffee',
      titleAm: 'ቡና',
      descriptionEn: 'Ethiopian coffee ceremony',
      orderIndex: 1,
    ),
    Lesson(
      id: 'food-water',
      categoryId: 'food',
      titleEn: 'Water',
      titleAm: 'ውሃ',
      orderIndex: 2,
    ),
    // Numbers
    for (int i = 1; i <= 10; i++)
      Lesson(
        id: 'number-$i',
        categoryId: 'numbers',
        titleEn: 'Number $i',
        titleAm: 'ቁጥር $i',
        orderIndex: i - 1,
      ),
    // Colors
    Lesson(
      id: 'color-green',
      categoryId: 'colors',
      titleEn: 'Green',
      titleAm: 'አረንጓዴ',
      orderIndex: 0,
    ),
    Lesson(
      id: 'color-yellow',
      categoryId: 'colors',
      titleEn: 'Yellow',
      titleAm: 'ቢጫ',
      orderIndex: 1,
    ),
    Lesson(
      id: 'color-red',
      categoryId: 'colors',
      titleEn: 'Red',
      titleAm: 'ቀይ',
      orderIndex: 2,
    ),
    // Everyday
    Lesson(
      id: 'everyday-help',
      categoryId: 'everyday',
      titleEn: 'Help',
      titleAm: 'እርዳታ',
      orderIndex: 0,
    ),
    Lesson(
      id: 'everyday-yes-no',
      categoryId: 'everyday',
      titleEn: 'Yes / No',
      titleAm: 'አዎ / አይ',
      orderIndex: 1,
    ),
  ];
}

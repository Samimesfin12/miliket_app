# Miliket - Ethiopian Sign Language Learning App

A Flutter Android application for learning Ethiopian Sign Language, built for 3.5 million deaf Ethiopians. Provides culturally relevant content including signs for injera, coffee ceremony, traditional greetings, and everyday vocabulary.

## Design System

- **Colors**: Ethiopian flag colors
  - Green: `#0F6A3C`
  - Yellow: `#FBC412`
  - Red: `#D11241`
- **Languages**: Bilingual (English/Amharic)
- **UI**: Mobile-first design with large touch targets and visual feedback

## Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.5.0 or higher)
- Android Studio or VS Code with Flutter extension
- Android SDK (API 21+)

## Setup

1. **Ensure Flutter is in your PATH**:
   ```bash
   flutter doctor
   ```

2. **Initialize the Flutter project** (if android/ folder is incomplete):
   ```bash
   cd miliket_app
   flutter create . --org com.miliket
   ```
   This will merge with existing lib/ code and create platform folders.

3. **Install dependencies**:
   ```bash
   flutter pub get
   ```

4. **Add camera permission** (already in AndroidManifest.xml):
   - Camera permission is declared for AI Practice Mode

## Running the App

```bash
flutter run
```

Or build APK:
```bash
flutter build apk --release
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── core/
│   ├── theme/               # Colors, theme
│   ├── database/            # SQLite (sqflite)
│   ├── router/              # go_router navigation
│   ├── localization/        # English/Amharic
│   └── constants/
├── providers/               # State management (Provider)
├── models/
├── data/                    # Lessons, dictionary data
└── screens/
    ├── auth/                # Sign in, Sign up, Forgot password
    ├── home/
    ├── learn/               # Categories, lessons, video
    ├── dictionary/
    ├── practice/            # AI Practice (camera + hand tracking)
    ├── profile/
    └── settings/
```

## Features

### Authentication
- Sign in / Sign up
- Forgot password flow
- Email/password (local SQLite)
- Language preference (English/Amharic)

### Learn Section
- 6 categories: Greetings, Family, Food, Numbers, Colors, Everyday
- Video lessons (YouTube integration ready)
- Progress tracking per lesson

### Dictionary
- Searchable sign language dictionary
- Favorites support
- Bilingual (English/Amharic)

### AI Practice Mode
- Camera-based hand tracking (MediaPipe/ML Kit)
- Accuracy scoring
- Session history
- Configured packages: `camera`, `google_mlkit_pose_detection`

### Progress Tracking
- XP system and levels
- Streak counter
- Achievements (scaffold ready)

## Database (SQLite)

Tables: `users`, `userProgress`, `lessonProgress`, `quizResults`, `achievements`, `dictionaryFavorites`, `practiceSessions`

## Packages

- **State**: provider
- **Database**: sqflite, path_provider
- **Auth**: shared_preferences
- **Video**: youtube_player_flutter
- **Camera/ML**: camera, google_mlkit_pose_detection
- **UI**: flutter_svg, cached_network_image, shimmer
- **Navigation**: go_router
- **i18n**: flutter_localizations, intl

## Next Steps

1. **YouTube integration**: Add video URLs to lessons and use `youtube_player_flutter`
2. **AI Practice**: Implement camera view + `google_mlkit_pose_detection` for hand landmarks
3. **Quiz system**: Add interactive quizzes with scoring
4. **Custom app icon**: Replace drawable/ic_launcher with designed assets
5. **Amharic fonts**: Add Noto Sans Ethiopic for better Amharic rendering

## License

For 3.5 million deaf Ethiopians. Use with care.
This is my first update.

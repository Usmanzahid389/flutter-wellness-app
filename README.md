
A Flutter wellness app with a dark-themed mobile UI for nutrition tracking, training plans, mood logging, and profile management.

<img width="377" height="815" alt="image" src="https://github.com/user-attachments/assets/098f9d23-a2d4-4486-9019-ed18ec8e8503" />
<img width="372" height="809" alt="image" src="https://github.com/user-attachments/assets/26164319-c00a-4dba-b5bd-340cfceae441" />
<img width="373" height="816" alt="image" src="https://github.com/user-attachments/assets/ac1a627d-34f5-4646-82d7-8e50c8c78c88" />
<img width="374" height="814" alt="image" src="https://github.com/user-attachments/assets/835e2e99-0a27-4c1a-a28d-9b402fbe6c86" />
<img width="373" height="814" alt="image" src="https://github.com/user-attachments/assets/d38fcb62-82ce-4fac-9cd5-68658d0c2075" />


**[Download APK]** (https://drive.google.com/file/d/1zs_stvetm27GAmKfSPgcgzKmW7DIYJW-/view?usp=sharing)


**[Watch App Demo Video]** (https://drive.google.com/file/d/1MAITgXW2RihDChl9QEDwYvh4tCQ3vU9I/view?usp=sharing)



## Features

- **Nutrition** — week selector, date strip, workout cards, and insight cards; calendar and notification bottom sheets
- **Plan** — training calendar with weekly workout schedule
- **Mood** — interactive mood ring selector with radial gradient background
- **Profile** — user avatar and settings-style menu items

## Dependencies Used & Why

### Production dependencies

| Package | Why it's used |
|---|---|
| `flutter` (SDK) | Core UI framework for building cross-platform screens, widgets, and navigation. |
| `go_router` | Declarative routing and bottom-tab navigation via `StatefulShellRoute`, keeping each tab's state when switching screens. |
| `google_fonts` | Loads and applies custom typography (e.g. Inter) to match the design system without bundling font files manually. |

### Dev dependencies

| Package | Why it's used |
|---|---|
| `flutter_test` | Widget and unit testing support for verifying UI behavior. |
| `flutter_lints` | Enforces recommended Dart/Flutter lint rules for consistent code quality (configured in `analysis_options.yaml`). |

### Built-in / SDK

| Dependency | Why it's used |
|---|---|
| Material Icons (`uses-material-design: true`) | Provides standard icons used across profile, navigation, and UI controls. |

## Project Structure

```
test_task/
├── lib/                    # Application source code
│   ├── main.dart           # App entry point; initializes Flutter and runs the root widget
│   ├── app.dart            # Root `MaterialApp.router` with theme and router configuration
│   ├── core/               # Shared app-wide code used across features
│   │   ├── router/         # `go_router` setup, route definitions, and bottom-nav shell wiring
│   │   ├── theme/          # Design tokens: colors, text styles, dimensions, and `ThemeData`
│   │   └── widgets/        # Reusable UI: bottom nav, status bar, nav icons, profile avatar, main shell
│   └── features/           # Feature modules, each scoped to a screen or domain area
│       ├── nutrition/
│       │   └── presentation/   # Nutrition tab UI (page, date strip, workout cards, insights)
│       ├── plan/
│       │   ├── data/           # Static/mock training schedule data
│       │   ├── domain/         # Training schedule entities and models
│       │   └── presentation/   # Plan tab UI (calendar, week sections, schedule cards)
│       ├── mood/
│       │   ├── domain/         # Mood type definitions
│       │   └── presentation/   # Mood tab UI (mood ring selector, emoji widgets)
│       ├── profile/
│       │   └── presentation/   # Profile tab UI (avatar, settings-style list items)
│       ├── notifications/
│       │   ├── data/           # Mock notification data
│       │   ├── domain/         # Notification entity models
│       │   └── presentation/   # Notification bottom sheet widget
│       └── calendar/
│           └── presentation/   # Calendar bottom sheet widget (used from Nutrition)
├── android/                # Android platform project (Gradle, manifest, Kotlin entry)
├── ios/                    # iOS platform project (Xcode, Info.plist, Swift entry)
├── macos/                  # macOS desktop platform project
├── linux/                  # Linux desktop platform project
├── windows/                # Windows desktop platform project
├── web/                    # Web platform assets (`index.html`, manifest)
└── test/                   # Widget and unit tests
```

### Folder purposes

| Directory | Purpose |
|---|---|
| `lib/core/` | Cross-cutting concerns shared by all features — routing, theming, and common widgets. |
| `lib/features/` | Self-contained feature modules organized by screen or business area. |
| `lib/features/*/domain/` | Business models and entities (e.g. `MoodType`, `TrainingSchedule`). |
| `lib/features/*/data/` | Data sources and mock/static content for UI prototyping. |
| `lib/features/*/presentation/` | Screens, widgets, and UI logic for each feature. |
| `android/`, `ios/`, etc. | Platform-specific build configuration and native entry points generated by Flutter. |
| `test/` | Automated tests run via `flutter test`. |

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.38+ recommended)
- A connected device or emulator (iOS, Android, macOS, or Chrome for web)

Check your setup:

```bash
flutter doctor
flutter devices
```

## Getting Started

Install dependencies:

```bash
flutter pub get
```

Run the app:

```bash
# Web (Chrome)
flutter run -d chrome

# macOS desktop
flutter run -d macos

# iOS simulator or Android emulator
flutter run
```

Run static analysis:

```bash
flutter analyze
```

Run tests:

```bash
flutter test
```

## Supported Platforms

Android, iOS, macOS, Linux, Windows, and Web.

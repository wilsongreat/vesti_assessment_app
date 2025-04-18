
# 📱 Vesti Assessment

This is a mobile app built with Flutter as part of vesti assessment. The project focuses on clean architecture, organized folder structure, modular components, and simple state management using ViewModels in Riverpod.

---

## Project Overview

Vesti Assessment is a mobile application that showcases a books in different categories and details of each book:

- View list of books on the app
- View the details of each book
- scroll to view more books
- add book to favourite 


## Features

- **book Feed**: View books
- **Scroll horizontally**: Scroll horizontally to view books feed
- **View Book details**: View details of each book

## 🗂️ Project Structure

```plaintext
lib/
├── config/
│   ├── app_colors.dart
│   └── router.dart
│
├── data/
│   ├── models/
│   │   ├── book_model.dart
│   │   └── app_assets.dart
│
├── presentation/
│   ├── components/
│   │   ├── book_card_widgets/
│   │   └── shared/
│   └── pages/
│       ├── auth/
│       └── dashboard/
│
├── providers/
│   ├── books_view_model.dart
│   └── books_view_model.g.dart
│
├── src/
│   └── components.dart
│
├── utils/
│   ├── constants.dart
│   ├── extensions.dart
│   └── screen_utils.dart
│
└── main.dart

```

## State Management

The application uses Riverpod for state management in conjuction with riverpod_generator:

- ` list of products`: Fetch list of products

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:

```bash
git clone https://github.com/wilsongreat/
```

2. Navigate to the project folder:

```bash
cd 
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

## Testing

The application includes widget tests to ensure UI components work as expected. Run tests with:

```bash
flutter test
```

### Key Test Cases

- Tab navigation functionality
- Search filtering
- Modal display for post creation

## GitHub Actions Integration

This project uses GitHub Actions for continuous integration. On each push or pull request to the
main branch, the workflow:

1. Sets up the Flutter environment
2. Gets all dependencies
3. Runs widget tests
4. Reports test results
5. Fails the workflow if any tests fail

### GitHub Actions Setup

Create a `.github/workflows/flutter_ci.yml` file with the following content:

```yaml
name: Flutter CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.27.3'
          channel: 'stable'

      - name: Install dependencies
        run: flutter pub get

      - name: Verify formatting
        run: dart format --output=none --set-exit-if-changed .

      - name: Analyze project source
        run: flutter analyze

      - name: Run tests
        run: flutter test --coverage

      - name: Upload coverage to Codecov
        uses: codecov/codecov-action@v3
        with:
          file: coverage/lcov.info
```
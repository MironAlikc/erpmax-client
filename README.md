# ERPMax Client

Flutter-based client application for ERPMax - a comprehensive ERP system with multi-tenant support.

## Overview

ERPMax Client is a cross-platform mobile and web application built with Flutter, providing enterprise resource planning capabilities with modern architecture and best practices.

## Features

- 🏢 **Multi-tenant Support** - Manage multiple organizations within a single application
- 🔐 **Authentication & Authorization** - Secure user authentication with JWT tokens
- 🔄 **Single Sign-On (SSO)** - Seamless authentication across services
- 💳 **Billing Management** - Comprehensive billing and payment processing
- 📊 **Dashboard** - Real-time analytics and business insights

## Architecture

The project follows **Clean Architecture** principles with a feature-based modular structure:

```text
lib/
├── core/                    # Core functionality and shared code
│   ├── api/                # API client configuration and interceptors
│   ├── auth/               # Authentication utilities
│   ├── di/                 # Dependency injection setup
│   ├── events/             # Event bus for app-wide communication
│   ├── navigation/         # Routing and navigation
│   ├── theme/              # App theming and styling
│   ├── utils/              # Utility functions and helpers
│   └── widgets/            # Reusable UI components
│
└── features/               # Feature modules
    ├── auth/               # Authentication feature
    ├── billing/            # Billing management
    ├── dashboard/          # Main dashboard
    ├── sso/                # Single Sign-On
    └── tenant/             # Tenant management
```

Each feature follows the **Clean Architecture** layers:

- **Presentation** - UI components, pages, and BLoC state management
- **Domain** - Business logic, entities, use cases, and events
- **Data** - Data sources, repositories, and models

## Tech Stack

### Core Dependencies

- **Flutter SDK** `^3.8.1` - Cross-platform UI framework
- **Dart** `^3.8.1` - Programming language

### State Management & Architecture

- **flutter_bloc** `^9.0.0` - BLoC pattern for state management
- **get_it** `^7.7.0` - Service locator for dependency injection
- **injectable** `^2.4.4` - Code generation for dependency injection
- **dartz** `^0.10.1` - Functional programming utilities

### Networking

- **dio** `^5.7.0` - HTTP client
- **retrofit** `^4.1.0` - Type-safe REST client

### Navigation

- **go_router** `^14.0.2` - Declarative routing

### Storage & Security

- **flutter_secure_storage** `^9.2.2` - Secure local storage for sensitive data

### Utilities

- **freezed** `^2.5.7` - Code generation for immutable classes
- **dartx** `^1.2.0` - Dart extensions
- **logging** `^1.2.0` - Logging utilities

## Getting Started

### Prerequisites

- Flutter SDK `^3.8.1`
- Dart SDK `^3.8.1`
- Android Studio / Xcode (for mobile development)
- Chrome (for web development)

### Installation

1. Clone the repository:

```bash
git clone <repository-url>
cd erpmax_client
```

1. Install dependencies:

```bash
flutter pub get
```

1. Generate code (for freezed, injectable, retrofit):

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Running the App

#### Development Mode

```bash
flutter run
```

#### Specific Platform

```bash
# iOS
flutter run -d ios

# Android
flutter run -d android

# Web
flutter run -d chrome

# macOS
flutter run -d macos
```

## Development

### Code Generation

The project uses code generation for:

- **Injectable** - Dependency injection
- **Freezed** - Immutable data classes
- **Retrofit** - API client generation

Run code generation:

```bash
# One-time generation
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerate on changes)
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Project Structure Guidelines

1. **Feature-based organization** - Each feature is self-contained
2. **Clean Architecture layers** - Separation of concerns (presentation, domain, data)
3. **Dependency Rule** - Dependencies point inward (presentation → domain ← data)
4. **Event-driven communication** - Use EventBus for cross-feature communication

### Adding a New Feature

1. Create feature directory structure:

```text
features/new_feature/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── events/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── bloc/
    ├── pages/
    └── widgets/
```

1. Implement layers following Clean Architecture
1. Register dependencies in DI container
1. Add routing configuration

## Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

## Building for Production

### Android

```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### iOS

```bash
flutter build ios --release
```

### Web

```bash
flutter build web --release
```

## Contributing

1. Follow the existing architecture patterns
2. Write tests for new features
3. Use English for code comments and UI text
4. Run code generation after changes
5. Ensure code passes linting: `flutter analyze`

## License

[Add your license information here]

## Contact

[Add contact information here]

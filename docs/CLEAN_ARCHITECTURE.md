# Clean Architecture Implementation

## Overview

All feature modules now follow Clean Architecture principles with clear separation of concerns across three layers:

## Layer Structure

### 1. Domain Layer (`domain/`)

- **Entities** (`entities/`): Pure business objects without dependencies on frameworks
- **Repositories** (`repositories/`): Abstract interfaces defining data operations
- **Use Cases** (optional, `usecases/`): Business logic operations

### 2. Data Layer (`data/`)

- **Models** (`models/`): Data transfer objects that extend entities, include serialization
- **Data Sources** (`datasources/`): Concrete implementations for data access (local, remote, cache)
- **Repositories** (`repositories/`): Concrete implementations of domain repository interfaces

### 3. Presentation Layer (`presentation/`)

- **Pages** (`pages/`): Screen-level widgets
- **Widgets** (`widgets/`): Reusable UI components
- **Views** (`views/`): Complex view components
- **BLoC/Cubit** (optional, `bloc/`): State management

## Module Structure

Each feature module follows this structure:

```
lib/features/{feature_name}/
├── domain/
│   ├── entities/
│   │   └── {entity_name}_entity.dart
│   └── repositories/
│       └── {repository_name}_repository.dart
├── data/
│   ├── models/
│   │   └── {model_name}_model.dart
│   ├── datasources/
│   │   └── {datasource_name}_datasource.dart
│   └── repositories/
│       └── {repository_name}_repository_impl.dart
└── presentation/
    ├── pages/
    ├── widgets/
    └── views/
```

## Refactored Modules

### 1. Dashboard Module

- **Entities**: `SummaryEntity`, `SubscriptionEntity`
- **Models**: `SummaryModel`, `SubscriptionModel`
- **Data Sources**: `DashboardLocalDataSource`
- **Repositories**: `DashboardRepository`, `DashboardRepositoryImpl`

### 2. SaaS Admin Module

- **Entities**: `ModuleTabEntity`
- **Models**: `ModuleTabModel`

### 3. Accounting Module

- **Entities**: `StatEntity`
- **Models**: `StatModel`

### 4. Subscription Module

- **Entities**: `SubscriptionDataEntity`
- **Models**: `SubscriptionDataModel`

## Dependency Rules

1. **Domain layer** has NO dependencies on other layers
2. **Data layer** depends only on Domain layer
3. **Presentation layer** depends on Domain layer (and optionally Data for DI)
4. Dependencies point inward: Presentation → Domain ← Data

## Benefits

- **Testability**: Each layer can be tested independently
- **Maintainability**: Clear separation of concerns
- **Scalability**: Easy to add new features following the same pattern
- **Flexibility**: Easy to swap implementations (e.g., change data sources)
- **Independence**: Business logic is independent of UI and frameworks

## Migration Notes

When updating existing code:

1. Import entities from `domain/entities/`
2. Import models from `data/models/`
3. Use models in presentation layer for UI-specific properties (icons, colors)
4. Use entities in business logic

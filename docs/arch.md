# TrueVibes Architecture

## Overview

TrueVibes is an AI-powered vibe coding platform that enables users to build applications and implement features using artificial intelligence assistance. The application follows a modern Flutter architecture with a clean separation of concerns and a feature-based organization.

## Project Structure

The project follows a feature-based Flutter project structure:

```
truevibes/
├── android/          # Android-specific configuration and code
├── ios/              # iOS-specific configuration and code
├── lib/              # Dart code for the application
│   ├── main.dart     # Application entry point
│   ├── models/       # Data models
│   │   └── project.dart  # Project data model
│   ├── screens/      # UI screens
│   │   └── project_list_screen.dart  # Project list screen
│   ├── services/     # Business logic services
│   │   └── storage_service.dart  # Project storage service
│   ├── utils/        # Utility functions and constants
│   └── widgets/      # Reusable UI components
│       └── project_list_item.dart  # Project item widget
├── macos/            # macOS-specific configuration (Flutter desktop support)
├── linux/            # Linux-specific configuration (Flutter desktop support)
├── windows/          # Windows-specific configuration (Flutter desktop support)
├── web/              # Web-specific configuration (Flutter web support)
├── test/             # Test files
└── pubspec.yaml      # Flutter/Dart dependency management
```

## Application Layers

The current implementation is minimal, but a typical Flutter application architecture would include:

1. **Presentation Layer**
   - Widgets (UI components)
   - Screens/Pages
   - Navigation

2. **Business Logic Layer**
   - State Management (not yet implemented, but could use providers, bloc, riverpod, etc.)
   - Services

3. **Data Layer**
   - Repositories
   - Data Models
   - API Clients
   - Local Storage

## Widget Structure

The current widget structure follows Flutter's stateful/stateless widget pattern with responsive design principles:

- `MyApp` (Stateless): Root widget that sets up the MaterialApp with theming and routes
- `ProjectListScreen` (Stateful): Main screen showing all projects with a responsive layout
- `ProjectListItem` (Stateless): Reusable widget for displaying project information
- `StorageService`: Service class for handling persistent storage using Hive
- `Project`: Data model representing project information

## Future Architecture Considerations

As TrueVibes develops, the architecture might evolve to include:

1. **Feature-based Organization**
   - Grouping code by features rather than technical concerns
   - Each feature having its own UI, business logic, and data components

2. **State Management Solution**
   - Implementation of a state management approach (Provider, Bloc, Riverpod, etc.)
   - Separation of UI and business logic

3. **Navigation Architecture**
   - Routing system for moving between screens
   - Possibly using named routes or the Navigator 2.0 API

4. **Data Persistence Strategy**
   - Local database integration (Hive, SQLite, etc.)
   - API integration for remote data
   - Caching strategies

5. **Testing Architecture**
   - Unit tests for business logic
   - Widget tests for UI components
   - Integration tests for feature flows

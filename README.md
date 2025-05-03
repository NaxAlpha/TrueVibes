# TrueVibes

![Flutter](https://img.shields.io/badge/Flutter-3.6.0-blue)
![Platforms](https://img.shields.io/badge/Platforms-Android%20%7C%20iOS%20%7C%20macOS%20%7C%20Windows%20%7C%20Linux-green)
![License](https://img.shields.io/badge/License-MIT-blue)

## Overview

TrueVibes is an AI-powered vibe coding platform that enables users to build applications and implement features using artificial intelligence assistance. Built with Flutter, it supports cross-platform development on iOS, Android, macOS, Windows, and Linux.

## Features

### Current Features

- **Project Management**
  - Create new projects with custom names
  - Open existing filesystem directories as projects
  - View project details including creation date and file path
  - Delete projects with confirmation dialog
  
- **Responsive UI**
  - Material Design 3 implementation with deep purple theme
  - Adaptive layouts for desktop and mobile
  - Consistent UI components across platforms
  
- **Cross-Platform Support**
  - Android platform configuration
  - iOS platform configuration 
  - macOS, Windows, Linux desktop support
  - Consistent experience across all platforms

### Planned Features

- AI-powered coding assistance
- Project editor with advanced features
- Settings customization
- Theme selection including dark mode

## Application Architecture

TrueVibes follows a clean, feature-based architecture:

```
truevibes/
├── lib/              
│   ├── models/       # Data models
│   ├── screens/      # UI screens
│   ├── services/     # Business logic services
│   ├── utils/        # Utility functions
│   └── widgets/      # Reusable UI components
```

## Getting Started

### Prerequisites

- Flutter SDK ^3.6.0
- Dart SDK ^3.6.0
- Android Studio / Xcode (for mobile development)
- VS Code or other IDE with Flutter support

### Installation

1. Clone the repository
   ```bash
   git clone https://github.com/yourusername/truevibes.git
   ```

2. Navigate to the project directory
   ```bash
   cd truevibes
   ```

3. Install dependencies
   ```bash
   flutter pub get
   ```

4. Run the application
   ```bash
   flutter run
   ```

## Development

### Build for different platforms

TrueVibes supports multiple platforms. Use the following commands to build for your target platform:

- **Android**
  ```bash
  flutter build apk
  ```

- **iOS**
  ```bash
  flutter build ios
  ```

- **macOS**
  ```bash
  flutter build macos
  ```

- **Windows**
  ```bash
  flutter build windows
  ```

- **Linux**
  ```bash
  flutter build linux
  ```

### Dependencies

- `path_provider`: Accessing filesystem paths
- `hive`: Lightweight and fast NoSQL database
- `hive_flutter`: Flutter-specific Hive utilities
- `intl`: Date formatting
- `file_picker`: Directory selection for projects
- `provider`: State management
- `permission_handler`: Managing system permissions

## User Guide

### Creating a New Project

1. Launch the TrueVibes application
2. Click the "CREATE NEW PROJECT" button
3. Enter a name for your project
4. Click "CREATE"

### Opening an Existing Project

1. Launch the TrueVibes application
2. Click the "OPEN EXISTING PROJECT" button
3. Select a directory from your filesystem
4. The project will be added to your project list

### Managing Projects

- **View Project Details**: Project cards display the name, directory path, and creation date
- **Open Project**: Click the "OPEN PROJECT" button on a project card
- **Delete Project**: Click the delete icon on a project card and confirm deletion

## Contributing

Contributions to TrueVibes are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

# Naasa X

## Project Overview
Naasa X is a Flutter-based application structured using the **Clean Architecture** pattern with a **feature-based** modular approach.

## Project Structure
The project follows a clean and organized structure:

- **lib/** – Main application code
  - `core/` – Core functionalities such as network layer, authentication, and common utilities
  - `modules/` – Modules separation with their corresponding features
  - `modules/moduleA/features/` – Modularized feature implementations
  - `modules/moduleA/utils/` – Shared utility classes among moduleA
  - `utils/` – Shared utility classes
- **test/** – Unit and widget tests
  - Mirrors the `lib/` structure to ensure test coverage

## Development Guidelines

### 1. **Architecture**
- The project follows **Clean Architecture** principles to maintain separation of concerns.
- Dependencies are managed using **Riverpod Providers** for dependency injection.
- **Riverpod** is used for state management.
- **Dio** is used for network requests.

### 2. **Testing**
- **Unit tests** and **Widget tests** are required for every module.
- Tests should be added inside the corresponding `test/` directory.
- Mocking should be done using **mocktail**.
- Use **fpdart** for functional programming utilities.

### 3. **Dependencies**
The following dependencies are used in the project:
- **Networking:** Dio, Pretty Dio Logger, GraphQL Client
- **State Management:** Riverpod
- **Storage:** Shared Preferences
- **Dependency Injection:** Riverpod
- **Functional Utilities:** Fpdart

### 4. **Setup Instructions**
To get started with development:
1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Ensure you have Flutter installed (`sdk: ^3.35.2`)
4. Run tests using `flutter test`
5. To build the project, use `flutter build` commands

### 5. **Test Coverage**
To check test coverage, follow these steps:
```sh
// Install coverage tool (only needed once)
brew install lcov

// Run tests with coverage
flutter test --coverage

// Generate HTML report
genhtml coverage/lcov.info -o coverage/

// Open the report in the browser
open coverage/index.html
```

For more details on test coverage in Flutter, refer to [this guide](https://codewithandrea.com/articles/flutter-test-coverage/).
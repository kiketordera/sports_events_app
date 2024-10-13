# Sports Events App

A Flutter application to browse, view, and manage sports events with efficient state management using BLoC, nested navigation and testing.


## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [State Management](#state-management)
- [Installation](#installation)
- [Usage](#usage)
- [Testing](#testing)
- [Structure](#structure)
- [License](#license)



## Overview

The **Sports Events App** is a Flutter-based mobile application designed to display and manage various sports events. It leverages the BLoC (Business Logic Component) pattern for robust state management, ensuring a scalable and maintainable codebase. The app offers a user-friendly interface with tabbed navigation, allowing users to browse events based on different date filters such as Yesterday, Today, and Tomorrow.

## Features


- **Tabbed Navigation:** Easily switch between Yesterday, Today, and Tomorrow event lists.
- **Event Details:** View comprehensive details for each sports event.
- **State Management with BLoC:** Efficiently manage and maintain app state.
- **Error Handling:** Gracefully handle data fetching errors with user-friendly messages and retry options.
- **Responsive Design:** Optimized for various screen sizes and orientations.
- **Comprehensive Testing:** Includes unit and integration tests to ensure reliability and correctness.

## Architecture

The app follows a clean and modular architecture, separating concerns into distinct layers:
- **Presentation Layer:** Flutter widgets and UI components.
- **Business Logic Layer:** BLoCs managing state and handling business logic.
- **Data Layer:** Repositories interfacing with data sources (local or remote).

This separation ensures that each component is maintainable, scalable, and testable.

## State Management
The application utilizes the **BLoC pattern** for state management, providing a clear separation between business logic and UI. Each tab in the application has its own `EventsBloc`, ensuring isolated and maintainable state management.


### EventsBloc

Handles events related to fetching and filtering sports events.

#### Events


- `LoadEvents`: Initiates the loading of events based on a date filter.

#### States

- `EventsInitial`: Initial state before any events are loaded.
- `EventsLoading`: Indicates that events are currently being loaded.
- `EventsLoaded`: Contains the list of successfully loaded events.
- `EventsError`: Represents an error state with an accompanying message.

## Installation


### Steps


1. **Clone the Repository:**

```
    git clone https://github.com/kiketordera/sports_events_app
```

2. **Navigate to the Project Directory:**
```
    cd sports_events_app
```
3. **Install Dependencies:**

```
    flutter pub get
```
4. **Generate Mocks for Testing:**

    Ensure `build_runner` and `mockito` are added to `dev_dependencies`.
```
    flutter pub run build_runner build
```

5. **Run the App:**
```
    flutter run
```
## Usage

Upon launching the app, you'll be presented with a home screen featuring three tabs: **YESTERDAY**, **TODAY**, and **TOMORROW**. Each tab displays a list of sports events filtered by the respective date. Tapping on an event navigates to a detailed view, providing comprehensive information about the selected event.

## Testing

The project includes both **unit tests** and **widget tests** to ensure the reliability and correctness of the application.

### Running Tests

To execute all tests, run:
```
    flutter pub run build_runner build
    flutter test
```
### Unit Tests

Located in the `test/bloc/events_bloc_test.dart`, these tests cover the `EventsBloc` logic, ensuring correct state emissions based on events and repository responses.

### Integration Tests

Located in the `integration_test/app_test.dart`, these tests cover the navigation through the interface and the different screens, ensuring correct navigation and display of the UI elements.


## Structure
```
lib/
├── blocs/
│   └── events/
│       ├── bloc.dart
│       ├── event.dart
│       └── state.dart
├── integration_test/app_test.dart
├── test/bloc/events_bloc_test.dart
├── models/
│   └── sports_event.dart
├── repositories/
│   └── sports_event_repository.dart
├── services/
│   └── sports_event_service.dart
├── ui/
│   ├── pages/
│   │   ├── events_detail_page.dart
│   │   └── events_home_page.dart
│   ├── widgets/
│   │   ├── event_cell.dart
│   │   ├── event_data.dart
│   │   ├── event_image.dart
│   │   ├── events_tab.dart
│   │   └── league_badge.dart
│   └── theme/
│       └── colors.dart
├── routes.dart
└── main.dart
```

## License

This project is licensed under the MIT License.



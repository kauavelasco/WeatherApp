# 🌤️ Weather App

A Flutter weather application created as a learning project to explore **Riverpod** and state management in Flutter.

The application retrieves the user's current location and uses it to display weather information for their region. It also provides an animated **Lottie** illustration that changes according to the current weather condition.

---

## 📱 Features

- 📍 Automatically retrieves the user's current location
- 🌡️️ Displays the current temperature
- ☁️ Displays the current weather condition
- 🎨 Shows an animated Lottie illustration based on the weather
- 🔄 State management with Riverpod
- 🌐 Fetches weather data from an external API
- 🧩 Organized project architecture with separation of responsibilities

---

## 🛠️ Technologies & Packages

This project was built with **Flutter** and **Dart**.

| Package | Version | Purpose |
|---|---|---|
| `geolocator` | `^14.1.1` | Retrieves the user's current geographic location |
| `http` | `^1.6.0` | Handles HTTP requests to the weather API |
| `lottie` | `^3.6.1` | Provides animated weather illustrations |
| `flutter_riverpod` | `^3.4.3` | State management and dependency management |

---

## 🏗️ Project Architecture

The project follows a simple layered structure to keep responsibilities separated and make the application easier to understand and maintain.

```text
lib/
├── models/
│   └── weather_model.dart
├── providers/
│   └── weather_provider.dart
├── repositories/
│   └── weather_repository.dart
├── screens/
│   └── weather_screen.dart
├── utils/
│   └── weather_animation.dart
└── main.dart
```

### 📂 Directory Details

- **`models/`**: Contains the data models used by the application.
  - `weather_model.dart` — Represents and organizes the weather data received from the API.
- **`providers/`**: Contains the Riverpod providers responsible for managing the application's state.
  - `weather_provider.dart` — Manages weather-related state and connects the UI with the data layer.
- **`repositories/`**: Responsible for communication with external data sources.
  - `weather_repository.dart` — Handles requests to the weather API and retrieves the required weather information.
- **`screens/`**: Contains the application's user interface.
  - `weather_screen.dart` — Main screen responsible for displaying the current weather information, temperature, region, and weather condition.
- **`utils/`**: Contains reusable utilities used by the application.
  - `weather_animation.dart` — Determines which Lottie animation should be displayed based on the current weather condition.
- **`assets/lottie/`**: Contains the Lottie animations used to visually represent different weather conditions.
  ```text
  assets/
  └── lottie/
      ├── cloudy.json
      ├── rain.json
      ├── storm.json
      └── sunny.json
  ```

---

## 🔄 Application Flow

1. User opens the application
2. Location permission is requested
3. The user's current location is retrieved
4. Weather information is requested
5. The weather data is processed
6. Riverpod updates the application state
7. The UI displays the weather information
8. The corresponding Lottie animation is displayed

The application separates the main responsibilities between the UI, state management, and data access layers.

---

## 📍 Location

The application uses the device's location to determine the user's current region.
`geolocator` is responsible for retrieving the user's geographic coordinates, which are then used to obtain the corresponding weather information.

> **Note:** Location permissions must be granted for the application to retrieve the user's current location.

---

## 🌦️ Weather Animations

The application includes different Lottie animations for different weather conditions:

| Weather Condition | Animation File |
|---|---|
| ☀️ Sunny | `sunny.json` |
| ☁️ Cloudy | `cloudy.json` |
| 🌧️ Rain | `rain.json` |
| ⛈️ Storm | `storm.json` |

The application selects the appropriate animation according to the current weather condition.

---

## 🧠 Architecture & Data Flow

The main data flow of the application can be represented as:

```text
┌──────────────┐
│      UI      │
│ WeatherScreen│
└──────┬───────┘
       │
       ▼
┌──────────────┐
│   Riverpod   │
│    Provider  │
└──────┬───────┘
       │
       ▼
┌──────────────┐
│  Repository  │
│  Weather API │
└──────┬───────┘
       │
       ▼
┌──────────────┐
│ Weather Model│
└──────────────┘
```

This structure helps keep each part of the application focused on a specific responsibility.

---

## 🚀 Getting Started

### Prerequisites
Make sure you have the following installed:
- Flutter SDK
- Dart SDK
- Android Studio or another Flutter-compatible IDE
- An Android device or emulator

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/kauavelasco/WeatherApp.git
   ```
2. Navigate to the project directory:
   ```bash
   cd weather_app
   ```
3. Install the dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

---

## 📸 Preview

The application provides a simple weather experience focused on displaying the most relevant information.
The main screen displays:
- 🌡️ Current temperature
- ☁️ Current weather condition
- 🎨 Animated visual representation of the weather

---

## 🎯 Project Goal & What I Learned

The main purpose of this project was to learn and practice Riverpod in a real Flutter application.
The weather application was used as a practical environment to understand how state management can work together with repositories, models, asynchronous operations, and UI components.

Throughout the project, I practiced:
- State management with Riverpod
- Providers and reactive UI updates
- Repository pattern
- Data modeling
- Asynchronous operations
- Location services
- HTTP requests and API integration
- Conditional UI rendering
- Lottie animations
- Separation of responsibilities
- Flutter application architecture

### Concepts Overview
```text
Flutter
   │
   ├── UI
   │
   ├── Riverpod
   │
   ├── Repository
   │
   ├── Model
   │
   ├── Location Services
   │
   └── API Integration
```

---

## 👨‍💻 Author

**Kauã Velasco**
- GitHub: [@kauavelasco](https://github.com/kauavelasco)

---

## ⭐ Acknowledgments

This project was developed as part of my journey learning Flutter and exploring different approaches to application architecture and state management.

The main focus of this project was learning how Riverpod can be used to manage application state while keeping the code organized and responsibilities separated.

If you are also learning Flutter, feel free to explore the code and use this project as a reference for experimenting with Riverpod, location services, API integration, repositories, and Lottie animations.
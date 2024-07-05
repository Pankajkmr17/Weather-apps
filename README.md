# Weather App

A simple weather app built with Flutter that displays current weather information for a given city. The app fetches weather data from the OpenWeatherMap API.

## Features

- Search for current weather by city name
- Displays weather details including:
  - City name
  - Current temperature (in Celsius)
  - Weather condition (e.g., cloudy, sunny, rainy)
  - An icon representing the weather condition
  - Humidity percentage
  - Wind speed
- Loading indicator while fetching data
- Proper error handling with user-friendly error messages
- State management using `Provider`
- Basic responsive design for both mobile and tablet devices
- Data persistence to save the last searched city
- Refresh button to fetch updated weather data


## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- OpenWeatherMap API key: [Get an API key](https://home.openweathermap.org/users/sign_up)

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/your-username/weather_app.git
    cd weather_app
    ```

2. Install dependencies:
    ```sh
    flutter pub get
    ```

3. Add your OpenWeatherMap API key:
    - Open `lib/services/weather_service.dart`
    - Replace `'YOUR_API_KEY'` with your actual OpenWeatherMap API key

### Running the App

- Run on an Android or iOS simulator:
    ```sh
    flutter run
    ```

### Project Structure

- `lib/models/`: Contains the `Weather` model class
- `lib/services/`: Contains the `WeatherService` class for API calls
- `lib/providers/`: Contains the `WeatherProvider` class for state management
- `lib/screens/`: Contains the UI screens (`HomeScreen` and `WeatherDetailsScreen`)
- `lib/main.dart`: Entry point of the app

### Dependencies

-sdk: flutter
-  http: ^0.13.6
-  provider: ^6.0.0
-  shared_preferences: ^2.0.6

### TODO

- Add more weather details (e.g., forecast, hourly updates)
- Improve UI/UX design
- Add localization support



### Acknowledgements

- [OpenWeatherMap](https://openweathermap.org/) for providing the weather API

## Contact

For any questions or suggestions, feel free to contact me at  pankaj.vishvakarma144878@gmail.com.

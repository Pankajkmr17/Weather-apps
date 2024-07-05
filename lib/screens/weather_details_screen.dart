
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class WeatherDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600;
        return Scaffold(
          appBar: AppBar(
            title: Text('Weather Details'),
            actions: [
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () async {
                  await Provider.of<WeatherProvider>(context, listen: false).fetchWeather(
                      Provider.of<WeatherProvider>(context, listen: false).weather!.cityName);
                },
              ),
            ],
          ),
          body: Consumer<WeatherProvider>(
            builder: (context, weatherProvider, child) {
              if (weatherProvider.weather == null) {
                return Center(child: Text('No data available'));
              }

              final weather = weatherProvider.weather!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: isTablet
                    ? Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('City: ${weather.cityName}', style: TextStyle(fontSize: 24)),
                          Text('Temperature: ${weather.temperature}°C', style: TextStyle(fontSize: 24)),
                          Text('Condition: ${weather.weatherCondition}', style: TextStyle(fontSize: 24)),
                          Image.network('http://openweathermap.org/img/w/${weather.icon}.png'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Humidity: ${weather.humidity}%', style: TextStyle(fontSize: 24)),
                          Text('Wind Speed: ${weather.windSpeed} m/s', style: TextStyle(fontSize: 24)),
                        ],
                      ),
                    ),
                  ],
                )
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('City: ${weather.cityName}', style: TextStyle(fontSize: 20)),
                    Text('Temperature: ${weather.temperature}°C', style: TextStyle(fontSize: 20)),
                    Text('Condition: ${weather.weatherCondition}', style: TextStyle(fontSize: 20)),
                    Image.network('http://openweathermap.org/img/w/${weather.icon}.png'),
                    Text('Humidity: ${weather.humidity}%', style: TextStyle(fontSize: 20)),
                    Text('Wind Speed: ${weather.windSpeed} m/s', style: TextStyle(fontSize: 20)),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

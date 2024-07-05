
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import 'weather_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<WeatherProvider>(context, listen: false).loadLastCity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Enter city name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    if (_controller.text.isNotEmpty) {
                      await Provider.of<WeatherProvider>(context, listen: false).fetchWeather(_controller.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WeatherDetailsScreen()),
                      );
                    }
                  },
                  child: Text('Get Weather'),
                ),
                Consumer<WeatherProvider>(
                  builder: (context, weatherProvider, child) {
                    if (weatherProvider.isLoading) {
                      return CircularProgressIndicator();
                    } else if (weatherProvider.errorMessage != null) {
                      return Text(weatherProvider.errorMessage!);
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

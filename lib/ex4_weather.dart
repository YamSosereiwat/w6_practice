import 'package:flutter/material.dart';

// EX 4 – The weather forecast (BONUS, handout page: EX 4)
// Images are in assets/ex4/.

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather Forecast'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              for (var city in CityWeather.values)
                Padding(padding: const EdgeInsets.only(bottom: 15),
                child: WeatherCard(cityWeather: city)
              )
            ]
          ),
        ),
      ),
    ),
  );
}

enum CityWeather {
  phnomPenh(
    cityName: 'PhnomPenh',
    minTemp: 10.0,
    maxTemp: 30.0,
    currentTemp: 12.2,
    image: 'assets/ex4/cloudy.png',
    gradientColors: [Color(0xFF9C27B0), Color(0xFFE040FB)],
  ),
  paris(
    cityName: 'Paris',
    minTemp: 10.0,
    maxTemp: 40.0,
    currentTemp: 22.2,
    image: 'assets/ex4/sunnyCloudy.png',
    gradientColors: [Color(0xFF26A69A), Color(0xFF66BB6A)],
  ),
  rome(
    cityName: 'Rome',
    minTemp: 10.0,
    maxTemp: 40.0,
    currentTemp: 45.2,
    image: 'assets/ex4/sunny.png',
    gradientColors: [Color(0xFFEF5350), Color(0xFFEC407A)],
  ),
  toulouse(
    cityName: 'Toulouse',
    minTemp: 10.0,
    maxTemp: 40.0,
    currentTemp: 45.2,
    image: 'assets/ex4/veryCloudy.png',
    gradientColors: [Color(0xFFFFA726), Color(0xFFFF7043)],
  );

  final String cityName;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final String image;
  final List<Color> gradientColors;

  const CityWeather({
    required this.cityName,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.image,
    required this.gradientColors,
  });
}

class WeatherCard extends StatelessWidget {

  final CityWeather cityWeather;

  const WeatherCard({
    super.key,
    required this.cityWeather
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: cityWeather.gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.purple,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    cityWeather.image,
                    height: 60,
                  )
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cityWeather.cityName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Min ${cityWeather.minTemp.toString()}°C',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13
                      ),
                    ),
                    Text(
                      'Max ${cityWeather.maxTemp.toString()}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '${cityWeather.currentTemp.toString()}°C',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  bool isLoading = true;
  bool isError = false;
  String location = '';
  String temperature = '';
  String description = '';
  String iconCode = '';
  String min = '';
  String max = '';

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  void fetchWeatherData() async {
    setState(() {
      isLoading = true;
      isError = false;
    });

    try {
      final String lat = "24.363588";
      final String lon = "88.624138";
      final String api_key = "35b02f6681185c5b6bd827482c79ef5c";
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$api_key'));
      if (response.statusCode == 200) {
        final weatherData = jsonDecode(response.body);

        setState(() {
          location = weatherData['name'];
          temperature = '${weatherData['main']['temp']}°C';
          description = weatherData['weather'][0]['description'];
          iconCode = weatherData['weather'][0]['icon'];
          min = '${weatherData['main']['temp_min']}';
          max = '${weatherData['main']['temp_max']}';

          isLoading = false;
        });
      } else {
        throw Exception('Failed to fetch weather data');
      }
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  String getTime() {
    setState(() {});
    var now = DateTime.now();
    var formattedTime = DateFormat('h:mm a').format(now);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body:
            Center(
              child: Container(
                color: Colors.purple,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isLoading)
                      CircularProgressIndicator()
                    else if (isError)
                      Text(
                        'Error fetching weather data',
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      )
                    else
                      Column(
                        children: [
                          Text(
                            location,
                            style: TextStyle(fontSize: 24,color: Colors.white),
                          ),
                          SizedBox(height: 4),
                          Text("Update: ${getTime().toString()} ",style: TextStyle(color: Colors.white),),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'http://openweathermap.org/img/w/$iconCode.png',
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 16),
                              Text(
                                temperature,
                                style: TextStyle(fontSize: 32,color: Colors.white),
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Max: $max",
                                    style: TextStyle(fontSize: 10,color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Min: $min",
                                    style: TextStyle(fontSize: 10,color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                            description,
                            style:
                                TextStyle(fontSize: 24, fontFamily: 'RobotoMono',color: Colors.white),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),

      ),
    );
  }
}

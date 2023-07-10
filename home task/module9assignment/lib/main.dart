import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
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
  String weatherIcon = '';
  String max='';
  String min='';


  String getTime() {
    var now = DateTime.now();
    var formattedTime = DateFormat('h:mm a').format(now);
    return formattedTime;
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    setState(() {
      isLoading = true;
      isError = false;
    });

    try {
      // Fetch user's location
      // You can use a location package like geolocator to get the current location
      String latitude = '24.363588';
      String longitude = '88.624138';

      // Fetch weather data using OpenWeatherMap API
      String apiKey = '35b02f6681185c5b6bd827482c79ef5c';
      String apiUrl =
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';

      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          location = data['name'];
          temperature = '${(data['main']['temp'] - 273.15).round()}°C';
          description = data['weather'][0]['description'];
          weatherIcon = data['weather'][0]['icon'];


          isLoading = false;
        });
      } else {
        setState(() {
          isError = true;
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Text('Weather App'),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
            IconButton(onPressed: (){}, icon: Icon(Icons.add)),
          ],
        ),
        body: Stack(

          children: [
            Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : isError
                  ? Text('Error fetching weather data.')
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    location,
                    style: TextStyle(fontSize: 24,color: Colors.white),

                  ),
                  SizedBox(width: 10,),
                  Text(
                    "Update: ${getTime().toString()}",style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'http://openweathermap.org/img/w/$weatherIcon.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10,),
                      SizedBox(height: 20),
                      Text(
                        temperature,
                        style: TextStyle(
                          fontSize: 48,
                          fontFamily: 'Arial',
                          color: Colors.white
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Arial',
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ],

        ),
      ),
    );
  }
}

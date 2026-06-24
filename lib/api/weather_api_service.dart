import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../model/weather_data.dart';

class WeatherApiService {
  final _dio = Dio();
  final _apiKey = '77edf4b1b87a711ef547da252b5a4adf';

  Future<WeatherData> fetchWeather() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('တည်နေရာ အသုံးပြုခွင့်မရပါ။');
    }
    Position position = await Geolocator.getCurrentPosition();
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$_apiKey&units=metric';
    final response = await _dio.get(url);
    print('Response : ${response.data}'); 
    if (response.statusCode == 200) {
      return WeatherData.fromJson(response.data);
    } else {
      throw Exception('ရာသီဉတု အချက်အလက် ယူမရပါ။');
    }
  }
}

final weatherApiServiceProvider = Provider<WeatherApiService>((ref) {
  return WeatherApiService();
});

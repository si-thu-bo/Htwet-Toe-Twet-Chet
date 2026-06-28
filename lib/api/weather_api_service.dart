import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:htwettoe_twetchet/config/config.dart';

import '../model/weather_data.dart';

class WeatherApiService {
  final _dio = Dio()
    ..options.baseUrl = baseUrl
    ..options.connectTimeout = Duration(seconds: 5)
    ..options.receiveTimeout = Duration(seconds: 5);

  final weaterRoute = '/api/weather';

  Future<WeatherData> fetchWeather() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('တည်နေရာ အသုံးပြုခွင့်မရပါ။');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception('တည်နေရာ အသုံးပြုခွင့်ကို အပြီးပိတ်ထားပါသည်။');
    }
    Position position = await Geolocator.getCurrentPosition();
    final response = await _dio.get(
      weaterRoute,
      queryParameters: {'lat': position.latitude, 'lon': position.longitude},
    );
    if (response.statusCode == 200 && response.data['success'] == true) {
      return WeatherData.fromJson(response.data['data']);
    } else {
      throw Exception('ရာသီဉတု အချက်အလက် ယူမရပါ။');
    }
  }
}

final weatherApiServiceProvider = Provider<WeatherApiService>((ref) {
  return WeatherApiService();
});

import 'package:htwettoe_twetchet/api/weather_api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/weather_data.dart';

part 'weather_view_model.g.dart';

@Riverpod(keepAlive: true)
class WeatherViewModel extends _$WeatherViewModel {
  @override
  Future<WeatherData> build() {
    return ref.watch(weatherApiServiceProvider).fetchWeather(); 
  }

  Future<void> refreshWeather() async {
    state = AsyncValue.loading();
    try {
      final weatherData = await ref.read(weatherApiServiceProvider).fetchWeather(); 
      state = AsyncValue.data(weatherData);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

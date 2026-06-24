class WeatherData {
  final String condition;
  final double temp;      
  final String icon;      
  final String cityName;

  WeatherData({
    required this.condition,
    required this.temp,
    required this.icon,
    required this.cityName,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      condition: json['weather'][0]['main'],
      temp: json['main']['temp'].toDouble(),
      icon: json['weather'][0]['icon'],
      cityName: json['name'],
    );
  }
}
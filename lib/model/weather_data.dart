class WeatherData {
  final String condition;
  final double temperature;
  final String location;
  final String iconCode;

  WeatherData({
    required this.condition,
    required this.temperature,
    required this.location,
    required this.iconCode
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      condition: json['condition'],
      temperature: json['temperature'],
      location: json['location'],
      iconCode: json['iconCode']
    );
  }
}

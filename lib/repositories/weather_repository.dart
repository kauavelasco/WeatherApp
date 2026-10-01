import 'dart:convert';

import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  Future<Weather> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final uri = Uri.parse(
      'https://api.open-meteo.com/v1/forecast'
      '?latitude=$latitude'
      '&longitude=$longitude'
      '&current=temperature_2m,weather_code',
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Erro ao buscar o clima');
    }

    final data = jsonDecode(response.body);

    return Weather(
      temperature: (data['current']['temperature_2m'] as num).toDouble(),
      weatherCode: data['current']['weather_code'] as int,
    );
  }
}

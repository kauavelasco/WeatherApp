import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/repositories/weather_repository.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepository();
});

class WeatherController extends AsyncNotifier<Weather> {
  @override
  Future<Weather> build() {
    return _loadWeather();
  }

  Future<Weather> _loadWeather() async {
    final repository = ref.read(weatherRepositoryProvider);
    final position = await _getLocation();

    return repository.getWeather(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  Future<Position> _getLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception('O serviço de localização está desativado');
    }

    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Permissão de localização negada permanentemente');
    }

    return Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.best),
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(_loadWeather);
  }
}

final weatherProvider = AsyncNotifierProvider<WeatherController, Weather>(
  WeatherController.new,
);

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/utils/weather_animation.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherProvider);

    return Scaffold(
      body: Center(
        child: weather.when(
          data: (weather) {
            final animation = getWeatherAnimation(weather.weatherCode);

            return Column(
              mainAxisAlignment: .center,
              children: [
                Lottie.asset(animation, width: 250, height: 250),
                SizedBox(height: 20),
                Text(
                  '${weather.temperature.toStringAsFixed(1)}°C',
                  style: TextStyle(fontSize: 48, fontWeight: .bold),
                ),
              ],
            );
          },
          error: (error, stackTrace) {
            return Column(
              mainAxisAlignment: .center,
              children: [
                Icon(Icons.error_outlined, size: 50),
                SizedBox(height: 16),
                Text(error.toString(), textAlign: .center),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: ref.read(weatherProvider.notifier).refresh,
                  child: const Text('Tentar novamente'),
                ),
              ],
            );
          },
          loading: () {
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

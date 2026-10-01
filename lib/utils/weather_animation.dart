String getWeatherAnimation(int weatherCode) {
  if (weatherCode == 0) {
    return 'assets/lottie/sunny.json';
  }
  if (weatherCode >= 1 && weatherCode <= 3) {
    return 'assets/lottie/cloudy.json';
  }
  if (weatherCode >= 51 && weatherCode <= 67) {
    return 'assets/lottie/rain.json';
  }
  if (weatherCode >= 80 && weatherCode <= 82) {
    return 'assets/lottie/rain.json';
  }
  if (weatherCode >= 95) {
    return 'assets/lottie/storm.json';
  }

  return 'assets/lottie/cloudy.json';
}

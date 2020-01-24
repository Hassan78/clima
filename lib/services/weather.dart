import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const String apiKey = "8b6f94efc814be5265ce14169cfb49d9";
const String weatherMapUrl = "https://api.openweathermap.org/data/2.5/weather";
class WeatherModel {

  

  Future<dynamic> getCityWeather(String cityName) async{
    NetworkHelper networkHelper = NetworkHelper("$weatherMapUrl?q=$cityName&appid=$apiKey&units=metric");
    var getWeatherData = await networkHelper.getData();
    return getWeatherData;

  }

  Future<dynamic> getLocationWeather()async{
    Location location = Location();
    await location.getLocation();

    
    NetworkHelper networkHelper = NetworkHelper
    ("$weatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
    
    var getWeatherData = await networkHelper.getData();
    return getWeatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

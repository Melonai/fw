import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:location/location.dart';
import 'package:weather/weather.dart';

class WeatherProvider extends StatefulWidget {
  final Widget child;

  const WeatherProvider({Key? key, required this.child}) : super(key: key);

  static CurrentWeather of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedWeather>()!.data;
  }

  @override
  CurrentWeather createState() => CurrentWeather(child: child);
}

class InheritedWeather extends InheritedWidget {
  final CurrentWeather data;

  const InheritedWeather({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWeather oldWidget) => true;
}

class CurrentWeather extends State<WeatherProvider> {
  final Widget child;

  Weather? weather;
  String? location;
  bool loading = true;

  CurrentWeather({
    required this.child,
  });

  @override
  void initState() {
    super.initState();
    setWeatherByCoordinates();
  }

  Future setWeatherByCity(String location) async {
    setState(() {
      this.location = location;
      this.weather = null;
      this.loading = true;
    });

    final wf = new WeatherFactory(dotenv.env['OPENWEATHER_TOKEN']!);
    final weather = await wf.currentWeatherByCityName(location);

    setState(() {
      this.loading = false;
      this.weather = weather;
    });
  }

  Future setWeatherByCoordinates() async {
    setState(() {
      this.location = null;
      this.weather = null;
      this.loading = true;
    });

    Location location = new Location();

    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        return;
      }
    }

    if (await location.hasPermission() == PermissionStatus.denied) {
      if (await location.requestPermission() != PermissionStatus.granted) {
        return;
      }
    }

    print("got perms :)");

    final locationData = await location.getLocation();

    print(locationData.toString());

    final wf = new WeatherFactory(dotenv.env['OPENWEATHER_TOKEN']!);
    final weather = await wf.currentWeatherByLocation(
        locationData.latitude!, locationData.longitude!);

    setState(() {
      this.weather = weather;
      this.location = weather.areaName;
      this.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedWeather(
      child: child,
      data: this,
    );
  }
}

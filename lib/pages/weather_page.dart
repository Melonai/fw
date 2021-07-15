import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class WeatherPage extends StatelessWidget {
  final Weather weather;

  WeatherPage({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 75.0, right: 50.0, top: 25.0, bottom: 25.0),
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Image(image: AssetImage("assets/sun.png"))),
            Text(
              "${this.weather.temperature!.celsius!.round()}º",
              style: TextStyle(fontSize: 60.0),
            ),
          ],
        ),
      ),
    );
  }
}

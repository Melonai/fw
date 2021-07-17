import 'package:flutter/material.dart';
import 'package:fw/constants.dart';
import 'package:weather/weather.dart';

class WeatherPage extends StatelessWidget {
  final Weather weather;

  WeatherPage({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        makeCurrentView(),
        // Scrolly Boys
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 24.0),
              makeInfoBox("Feels like",
                  "${this.weather.tempFeelsLike!.celsius!.toInt()}°"),
              makeInfoBox("Wind", "${this.weather.windSpeed} m/s"),
              makeInfoBox("Humidity",
                  this.weather.humidity!.toStringAsPrecision(2) + "%"),
            ],
          ),
        ),
      ],
    );
  }

  Padding makeCurrentView() {
    return new Padding(
      padding: new EdgeInsets.all(24.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [FWColors.FW_BLUE, FWColors.FW_BLUE_DARKER],
            center: Alignment(0, -0.40),
            radius: 0.6,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          border: Border.all(color: Colors.white.withOpacity(0.25)),
          boxShadow: [
            BoxShadow(
              color: FWColors.FW_BLUE.withOpacity(0.25),
              blurRadius: 20.0,
              offset: Offset(0.0, 4.0),
            )
          ],
        ),
        alignment: AlignmentDirectional.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            children: [
              Image(
                image: AssetImage("assets/sun.png"),
                height: 150,
              ),
              Text.rich(
                TextSpan(
                  text: this.weather.temperature!.celsius!.round().toString(),
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "°",
                      style: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3.0,
                    horizontal: 18.0,
                  ),
                  child: Text(
                    this.weather.weatherMain!,
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInfoBox(String title, String content) {
    return Container(
      height: 80,
      width: 120,
      padding: EdgeInsets.all(18.0),
      // The bottom margin prevents the shadow from being cut off.
      margin: EdgeInsets.only(right: 24.0, bottom: 10.0),
      decoration: BoxDecoration(
        color: FWColors.FW_CONTAINER,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        border: Border.all(color: Colors.white.withOpacity(0.25)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4.0,
            offset: Offset(0.0, 4.0),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: FWColors.FW_TEXT_DIMMED)),
          Text(content),
        ],
      ),
    );
  }
}

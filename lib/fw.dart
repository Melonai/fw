import 'package:flutter/material.dart';
import 'package:fw/constants.dart';
import 'package:fw/pages/blank_page.dart';
import 'package:fw/pages/loading_page.dart';
import 'package:fw/pages/weather_page.dart';
import 'package:fw/providers/weather_provider.dart';

class FW extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FWState();
}

class _FWState extends State<FW> {
  @override
  Widget build(BuildContext context) {
    return WeatherProvider(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: FWColors.FW_DARK_GREEN,
        appBar: _createAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 140.0),
              Builder(builder: (BuildContext pageContext) {
                final currentWeather = WeatherProvider.of(pageContext);

                if (currentWeather.loading) {
                  return LoadingPage();
                } else if (currentWeather.weather == null) {
                  return BlankPage();
                } else {
                  return WeatherPage(weather: currentWeather.weather!);
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _createAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 90.0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                FWColors.FW_DARK_GREEN,
                FWColors.FW_DARK_GREEN.withOpacity(0)
              ],
              stops: [
                0.25,
                1
              ]),
        ),
      ),
      title: Builder(builder: (BuildContext context) {
        final currentWeather = WeatherProvider.of(context);
        return Text(
          currentWeather.location ?? 'Loading...',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        );
      }),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
    );
  }
}

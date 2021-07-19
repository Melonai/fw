import 'package:flutter/material.dart';
import 'package:fw/pages/blank_page.dart';
import 'package:fw/pages/loading_page.dart';
import 'package:fw/pages/search_page.dart';
import 'package:fw/pages/weather_page.dart';
import 'package:fw/providers/weather_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class FW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FW",
      theme: _createThemeData(Theme.of(context)),
      initialRoute: "/",
      routes: {
        "/": (_context) => WeatherProvider(
              child: _weatherPage(),
            ),
        "/city": (context) {
          final location =
              ModalRoute.of(context)!.settings.arguments! as String;

          return WeatherProvider(
            child: _weatherPage(),
            location: location,
          );
        },
        "/search": (_context) => SearchPage()
      },
    );
  }

  Widget _weatherPage() {
    return Builder(
      builder: (context) {
        final currentWeather = WeatherProvider.of(context);

        if (currentWeather.loading) {
          return LoadingPage();
        } else if (currentWeather.weather == null) {
          return BlankPage();
        } else {
          return WeatherPage(
            weather: currentWeather.weather!,
            location: currentWeather.location!,
          );
        }
      },
    );
  }

  ThemeData _createThemeData(ThemeData currentThemeData) {
    final openSansTheme =
        GoogleFonts.openSansTextTheme(currentThemeData.textTheme);

    return ThemeData(
      brightness: Brightness.dark,
      accentColor: Colors.white,
      textTheme: openSansTheme.apply(bodyColor: Colors.white),
      primaryTextTheme: openSansTheme.apply(bodyColor: Colors.white),
      accentTextTheme: openSansTheme,
    );
  }
}

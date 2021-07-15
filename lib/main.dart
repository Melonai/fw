import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fw/fw.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async {
  // Load the configuration file.
  await dotenv.load();
  assert(dotenv.isEveryDefined(["OPENWEATHER_TOKEN"]),
      "Not all required environment variables were defined.");

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FW",
      theme: _createThemeData(Theme.of(context)),
      home: FW(),
    );
  }

  ThemeData _createThemeData(ThemeData currentThemeData) {
    final overpassTheme =
        GoogleFonts.overpassTextTheme(currentThemeData.textTheme);

    return ThemeData(
      brightness: Brightness.dark,
      accentColor: Colors.white,
      textTheme: overpassTheme.apply(bodyColor: Colors.white),
      primaryTextTheme: overpassTheme.apply(bodyColor: Colors.white),
      accentTextTheme: overpassTheme,
    );
  }
}

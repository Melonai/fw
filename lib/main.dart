import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fw/fw.dart';

Future main() async {
  // Load the configuration file.
  await dotenv.load();
  assert(dotenv.isEveryDefined(["OPENWEATHER_TOKEN"]),
      "Not all required environment variables were defined.");

  runApp(FW());
}

import 'package:flutter/material.dart';
import 'package:swifty_companion/themes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'modules/homepage/HomePage.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MaterialApp(theme: AppTheme.lightTheme, home: HomePage()),
  );
}

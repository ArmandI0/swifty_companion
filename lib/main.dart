import 'package:flutter/material.dart';
import 'package:swifty_companion/themes.dart';
import 'components/AppBar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SetScaffold extends StatelessWidget {
  final String title;

  const SetScaffold({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Coucou'),

      body: Center(child: Text('Bonjour !')
      ),
    );
  }
}

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MaterialApp(theme: AppTheme.lightTheme, home: SetScaffold(title: 'COUCOU')),
  );
}

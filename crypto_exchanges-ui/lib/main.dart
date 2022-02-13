import 'package:crypto_exchanges/routes.dart';
import 'package:crypto_exchanges/screens/main_page.dart';
import 'package:crypto_exchanges/theme/theme_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = new ThemeProvider(isLightTheme: false);
    return MaterialApp(
      title: 'Crypto exchanges',
      routes: routes,
      theme: themeProvider.themeData(),
      home: MainPage(),
    );
  }
}



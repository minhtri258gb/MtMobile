import 'package:flutter/material.dart';
import 'common/routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Nunito',
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routing.defaultRoute,
      routes: Routing.routes,
    );
  }
}

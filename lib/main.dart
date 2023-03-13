import 'package:flutter/material.dart';
import './pages/home.dart';
// import './pages/test.dart';
// import 'pages/list_view.dart';
// import './pages/test/native.dart';
// import 'pages/test/rest_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

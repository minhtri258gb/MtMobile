import 'package:flutter/cupertino.dart';

import '../pages/home/page.dart';
import '../pages/login/page.dart';
import '../pages/map/page2.dart';

class Routing {
  static const String defaultRoute = "/login";
  static Map<String, Widget Function(BuildContext)> routes = {
    '/login': (context) => const LoginPage(),
    '/home': (context) => const HomePage(),
    '/map': (context) => const MapPage(),
  };
}

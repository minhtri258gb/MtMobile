import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../modules/app_bar.dart';
import '../../modules/side_menu.dart';
import '../chat/button_float.dart';
import 'tabpanel.dart';
import '../map/page2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    // Auto go Music page
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MapPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MtAppBar(),
      drawer: SideMenu(),
      body: HomeTabPanel(),
      floatingActionButton: ChatButtonFloat(),
    );
  }
}

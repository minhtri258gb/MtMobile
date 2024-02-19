import 'package:flutter/material.dart';

class HomeTabPanel extends StatefulWidget {
  const HomeTabPanel({super.key});

  @override
  State<HomeTabPanel> createState() => _HomeTabPanelState();
}

class _HomeTabPanelState extends State<HomeTabPanel> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fixed Tabs'),
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff5808e5),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Color.fromARGB(255, 210, 210, 210),
            tabs: [
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite),
                    SizedBox(width: 8),
                    Text('DOGS')
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 8),
                    Text('CATS')
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 8),
                    Text('BIRDS')
                  ],
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('DOGS')),
            Center(child: Text('CATS')),
            Center(child: Text('BIRDS')),
          ],
        ),
      ),
    );
  }
}

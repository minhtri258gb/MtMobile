import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../utils/rand.dart';
import '../side_menu.dart';
import '../../examples/my_tab.dart';
import '../music/page.dart';
import '../chat/page_list.dart';
import '../login/page.dart';

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
            builder: (context) => const MusicPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          // Begin Menu
          MenuBar(
            children: [
              SubmenuButton(
                menuChildren: [
                  const SubmenuButton(
                    menuChildren: [
                      MenuItemButton(
                        shortcut: null,
                        onPressed: null,
                        child: Text('Menu Item 1.1'),
                      ),
                    ],
                    child: Text("Sub menu 2"),
                  ),
                  MenuItemButton(
                    shortcut: null,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MusicPage(),
                          ));
                    },
                    child: const Text('Music'),
                  ),
                  MenuItemButton(
                    shortcut: null,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatListPage(),
                          ));
                    },
                    child: const Text('Chat'),
                  ),
                  const MenuItemButton(
                    shortcut: null,
                    onPressed: null,
                    child: Text('Menu Item 3'),
                  ),
                ],
                leadingIcon: const Icon(
                  Icons.menu,
                ),
                child: const Text(
                  "Menu",
                ),
              ),
            ],
          ),
          // End Menu
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          PopupMenuButton<String>(
            child: const Icon(Icons.apps_sharp),
            itemBuilder: (BuildContext context) {
              return {'Music', 'Piano', 'Manager'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            onSelected: (String value) {
              switch (value) {
                case 'Music':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MusicPage(),
                    ),
                  );
                  break;
                case 'Piano':
                  break;
                case 'Manager':
                  break;
              }
            },
          ),
          IconButton(icon: const Icon(Icons.calendar_month), onPressed: () {}),
          IconButton(icon: const Icon(Icons.download), onPressed: () {}),
          // Begin Avatar
          CircleAvatar(
            backgroundColor: Rand.getColor(),
            child: const Text('AH'),
          ),
          const CircleAvatar(
            backgroundImage: AssetImage("images/avatar/guest.png"),
          ),
          // End Avatar
          PopupMenuButton<String>(
            onSelected: (String value) {
              switch (value) {
                case 'Logout':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                  break;
                case 'Settings':
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      drawer: const SideMenu(),
      body: const MyTab(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChatListPage(),
            ),
          );
        },
        tooltip: 'Chat',
        child: const Icon(Icons.chat),
      ),
    );
  }
}

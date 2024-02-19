import 'package:flutter/material.dart';

import '../pages/chat/list_page.dart';
import '../pages/login/page.dart';
import '../pages/music/page.dart';
import '../pages/qrscan/page.dart';
import '../utils/rand.dart';

class MtAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MtAppBar({super.key});

  @override
  final Size preferredSize = const Size.fromHeight(56.0);

  @override
  State<StatefulWidget> createState() => _MtAppBarState();
}

class _MtAppBarState extends State<MtAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        IconButton(
            tooltip: "QR Scan",
            icon: const Icon(Icons.qr_code),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QRScanPage(),
                  ));
            }),
        IconButton(
            tooltip: "Notifications",
            icon: const Icon(Icons.notifications),
            onPressed: () {}),
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
    );
  }
}

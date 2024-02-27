import 'package:flutter/material.dart';

import '../common/routing.dart';

class SideMenu extends StatelessWidget {
  final List<Menu> menus = [
    Menu(name: "Home", direct: "home", iconName: "home"),
    Menu(name: "Map", direct: "map", iconName: "map"),
    Menu(name: "Inbox", direct: "chat", iconName: "chat", trailing: "99+"),
    Menu(name: "Starred", direct: "star", iconName: "star_border"),
    Menu(name: "Snoozed", direct: "snoozed", iconName: "snooze"),
    Menu(
        name: "Important",
        direct: "important",
        iconName: "label_important",
        iconColor: "blue"),
    Menu(name: "draft", direct: "draft", iconName: "inbox"),
    Menu(name: "Sent", direct: "sent", iconName: "inbox"),
    Menu(name: "Logout", direct: "login", iconName: "inbox"),
  ];

  SideMenu({super.key});

  getListMenuWidget() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.white,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Text(
              "Menu",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 30, 27, 255),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ListView.builder(
            itemCount: menus.length,
            itemBuilder: (context, index) {
              return menus[index].getWidget(context);
            },
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}

class Menu {
  String name;
  String direct;
  String? iconName;
  String? iconColor;
  String? trailing;

  final mapIcon = {
    "map": Icons.map,
    "home": Icons.home,
    "star_border": Icons.star_border,
    "snooze": Icons.snooze,
    "label_important": Icons.label_important,
  };

  final mapColor = {
    "blue": Colors.blue,
  };

  Menu({
    required this.name,
    required this.direct,
    this.iconName,
    this.iconColor,
    this.trailing,
  });

  getWidget(context) {
    return ListTile(
      title: Text(name),
      leading: getIcon(),
      trailing: getTrailing(),
      onTap: () => {directPage(context)},
    );
  }

  getIcon() {
    IconData? iconData = mapIcon[iconName];
    iconData ??= Icons.inbox; // Default

    Color? color = mapColor[iconColor];
    color ??= Colors.black; // Default

    return Icon(iconData, color: color);
  }

  getTrailing() {
    if (trailing != null) {
      return Text(trailing!);
    }
    return null;
  }

  directPage(context) {
    String url = '/$direct';
    bool isSameRouting = false;
    Navigator.popUntil(context, (route) {
      isSameRouting = (route.settings.name == url);
      return true;
    });
    Navigator.pop(context); // Tắt slide menu
    if (!isSameRouting && Routing.routes.containsKey(url)) {
      Navigator.pushNamed(context, url); // Chuyển hướng
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenuApp extends StatefulWidget {
  const SideMenuApp({super.key, required this.title});

  final String title;

  @override
  State<SideMenuApp> createState() => _MySideMenuState();
}

class _MySideMenuState extends State<SideMenuApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      drawer: const SideMenu(),
      // body: Container(
      //   width: 288,
      //   height: double.infinity,
      //   color: const Color(0xFF17203A),
      //   child: SafeArea(
      //     child: Column(
      //       children: [
      //         const InfoCard(name: "Massan", profession: "Programer"),
      //         Padding(
      //           padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
      //           child: Text(
      //             "Browser".toUpperCase(),
      //             style: Theme.of(context)
      //                 .textTheme
      //                 .titleMedium!
      //                 .copyWith(color: Colors.white70),
      //           ),
      //         ),
      //         ...sideMenus.map(
      //           (menu) => SideMenuItem(
      //             menu: menu,
      //             press: () {},
      //             isActive: false,
      //           );
      //         );
      //       ],
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {}, // <-- Opens drawer
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.name,
    required this.profession,
  }) : super(key: key);

  final String name, profession;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
          backgroundColor: Colors.white24,
          child: Icon(
            CupertinoIcons.person,
            color: Colors.white,
          )),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        profession,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class SideMenuItem extends StatelessWidget {
  SideMenuItem({Key? key}) : super(key: key);

  final menu = null;
  final VoidCallback press = () {};
  final bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Divider(color: Colors.white24, height: 1)),
        ListTile(
          // onTap: press,
          leading: SizedBox(
            height: 34,
            width: 34,
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

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
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.inbox,
              color: Colors.black,
            ),
            trailing: const Text("99+"),
            title: const Text("Inbox"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.star_border,
              color: Colors.black,
            ),
            title: const Text("Starred"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.snooze,
              color: Colors.black,
            ),
            title: const Text("Snoozed"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.label_important,
              color: Colors.black,
            ),
            title: const Text("Important"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.inbox,
              color: Colors.black,
            ),
            title: const Text("draft"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.inbox,
              color: Colors.black,
            ),
            title: const Text("sent"),
          )
        ],
      ),
    );
  }
}

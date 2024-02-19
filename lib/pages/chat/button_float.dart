import 'package:flutter/material.dart';

import 'list_page.dart'; // ChatListPage

class ChatButtonFloat extends StatefulWidget {
  const ChatButtonFloat({super.key});

  @override
  State<StatefulWidget> createState() => _ChatButtonFloatState();
}

class _ChatButtonFloatState extends State<ChatButtonFloat> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
    );
  }
}

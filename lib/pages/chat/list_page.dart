import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mtmobile/pages/chat/message.dart';

import '../../utils/rand.dart';
import 'contact.dart';
import 'detail_page.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  // Data manager
  List<Contact> contacts = [];
  List<Contact> favContacts = [];

  // Native

  @override
  void initState() {
    super.initState();

    contacts = [
      Contact(
        name: "Sam",
        avatarUrl: "images/avatar/Sam.png",
        lastMessage: Message(
          text: "Not at all",
          date: DateFormat("yyyy-MM-dd hh:mm:ss").parse("2021-05-12 23:23:00"),
          isReaded: true,
        ),
      ),
      Contact(
        name: "Willson",
        isFavorite: true,
        avatarUrl: "images/avatar/Willson.png",
        lastMessage: Message(
          text:
              "This text will very longer for test something if screem is break to check front end is good",
          date: DateFormat("yyyy-MM-dd hh:mm:ss").parse("2021-05-12 23:23:00"),
        ),
      ),
      Contact(
        name: "Lian",
        isFavorite: true,
        avatarUrl: "images/avatar/Lian.png",
      ),
      Contact(
        name: "Anonymos Guy",
        isFavorite: true,
      ),
      Contact(
        name: "Nero",
        isFavorite: true,
        avatarUrl: "images/avatar/Nero.png",
      ),
      Contact(
        name: "Jean",
        avatarUrl: "images/avatar/Jean.png",
      ),
      Contact(
        name: "Nina",
        isFavorite: true,
        avatarUrl: "images/avatar/Nina.png",
      ),
      Contact(
        name: "Joinhan",
        isFavorite: true,
        avatarUrl: "images/avatar/Joinhan.png",
      ),
      Contact(
        name: "Caver",
        avatarUrl: "images/avatar/Caver.png",
      ),
      Contact(
        name: "Kity",
        isFavorite: true,
        avatarUrl: "images/avatar/Kity.png",
      ),
      Contact(
        name: "Jonathan",
        avatarUrl: "images/avatar/Jonathan.png",
      ),
      Contact(
        name: "Tarian",
        isFavorite: true,
        avatarUrl: "images/avatar/Tarian.png",
      ),
      Contact(
        name: "Kilana",
        isFavorite: true,
        avatarUrl: "images/avatar/Kilana.png",
      ),
      Contact(
        name: "Sily",
        avatarUrl: "images/avatar/Sily.png",
      ),
    ];

    favContacts.clear();
    for (var contact in contacts) {
      if (contact.isFavorite) {
        favContacts.add(contact);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: const BackButton(),
        title: const Center(
          child: Text("Chat list"),
        ),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Search",
            onPressed: null,
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Begin Favorite contact
            Container(
              height: 111.0,
              color: Colors.blue.shade100,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: favContacts.length,
                itemBuilder: (context, index) {
                  var contact = favContacts[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        contact.avatarUrl.isEmpty
                            ? CircleAvatar(
                                radius: 35.0,
                                backgroundColor: Rand.getColor(),
                                child: Text(
                                  contact.name.substring(0, 2).toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              )
                            : CircleAvatar(
                                radius: 35.0,
                                // backgroundImage: contact.avatarType == 1
                                //     ? AssetImage(contact.avatarUrl)
                                //     : NetworkImage(contact.avatarUrl),
                                backgroundImage: AssetImage(contact.avatarUrl),
                              ),
                        Text(
                          contact.name.length <= 8
                              ? contact.name
                              : "${contact.name.substring(0, 7)}...",
                          style: const TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // End Favorite contact
            // Begin List contact
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  final contact = contacts[index];
                  return Card(
                    elevation: 8.0,
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatDetailPage(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: contact.avatarUrl.isEmpty
                                ? CircleAvatar(
                                    radius: 35.0,
                                    backgroundColor: Rand.getColor(),
                                    child: Text(
                                      contact.name
                                          .substring(0, 2)
                                          .toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 35.0,
                                    backgroundImage:
                                        AssetImage(contact.avatarUrl),
                                  ),
                            title: Text(contact.name),
                            subtitle: contact.lastMessage == null
                                ? null
                                : Text(contact.lastMessage!.text.length <= 32
                                    ? contact.lastMessage!.text
                                    : '${contact.lastMessage!.text.substring(0, 30)}...'),
                            trailing: contact.lastMessage == null
                                ? null
                                : Text(
                                    "${DateTime.now().difference(contact.lastMessage!.date).inDays} day ago",
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  );
                  // Row(
                  //   children: [
                  //     CircleAvatar(
                  //       radius: 35.0,
                  //       backgroundImage: AssetImage(contact.avatarUrl),
                  //     ),
                  //     Text(contact.name),
                  //   ],
                  // );
                },
              ),
            ),
            // End List contact
          ],
        ),
      ),
    );
  }
}

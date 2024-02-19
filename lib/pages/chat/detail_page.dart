import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import 'message.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({super.key});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  // Message input controller
  late TextEditingController inputCtrl;
  late FocusNode inputFocus;

  // Flag
  bool _isTyping = false;

  // Data Mgr
  var messages = [
    Message(
        text: "Lorem Ipsum",
        date: DateTime.now().subtract(const Duration(days: 4, minutes: 3))),
    Message(
        text: "simply dummy text of the printing and typesetting industry",
        isSendByMe: true,
        date: DateTime.now().subtract(const Duration(days: 4, minutes: 3))),
    Message(
        text: "Lorem Ipsum",
        date: DateTime.now().subtract(const Duration(days: 4, minutes: 3))),
    Message(
        text: "simply dummy text of the printing and typesetting industry",
        isSendByMe: true,
        date: DateTime.now().subtract(const Duration(days: 4, minutes: 3))),
    Message(
        text: "Lorem Ipsum",
        date: DateTime.now().subtract(const Duration(days: 4, minutes: 3))),
    Message(
        text: "simply dummy text of the printing and typesetting industry",
        isSendByMe: true,
        date: DateTime.now().subtract(const Duration(days: 4, minutes: 3))),
    Message(
        text: "Lorem Ipsum",
        date: DateTime.now().subtract(const Duration(days: 4, minutes: 3))),
    Message(
        text: "simply dummy text of the printing and typesetting industry",
        isSendByMe: true,
        date: DateTime.now().subtract(const Duration(days: 4, minutes: 3))),
    Message(
        text: "Lorem Ipsum",
        date: DateTime.now().subtract(const Duration(days: 3, minutes: 3))),
    Message(
        text: "simply dummy text of the printing and typesetting industry",
        isSendByMe: true,
        date: DateTime.now().subtract(const Duration(days: 3, minutes: 3))),
    Message(
        text: "Lorem Ipsum",
        date: DateTime.now().subtract(const Duration(days: 3, minutes: 3))),
    Message(
        text: "simply dummy text of the printing and typesetting industry",
        isSendByMe: true,
        date: DateTime.now().subtract(const Duration(days: 3, minutes: 3))),
    Message(
        text: "Lorem Ipsum",
        date: DateTime.now().subtract(const Duration(days: 3, minutes: 3))),
    Message(
        text: "simply dummy text of the printing and typesetting industry",
        isSendByMe: true,
        date: DateTime.now().subtract(const Duration(days: 3, minutes: 3))),
    Message(
        text: "Lorem Ipsum",
        date: DateTime.now().subtract(const Duration(days: 3, minutes: 3))),
    Message(
        text: "simply dummy text of the printing and typesetting industry",
        isSendByMe: true,
        date: DateTime.now().subtract(const Duration(days: 3, minutes: 3))),
    Message(text: "but"),
    Message(text: "sometimes by accident, sometimes on purpose"),
    Message(text: "It has roots in a piece of classical", isSendByMe: true),
    Message(text: "Richard McClintock"),
    Message(text: "but"),
    Message(text: "sometimes by accident, sometimes on purpose"),
    Message(text: "It has roots in a piece of classical", isSendByMe: true),
    Message(text: "Richard McClintock"),
  ];

  // Native

  @override
  void initState() {
    super.initState();

    inputCtrl = TextEditingController();
    inputFocus = FocusNode();
  }

  @override
  void dispose() {
    inputCtrl.dispose();
    inputFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: const BackButton(),
        title: const Center(
          child: Text('Chat'),
        ),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GroupedListView<Message, DateTime>(
                padding: const EdgeInsets.all(8),
                reverse: true,
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                elements: messages,
                groupBy: (message) => DateTime(
                  message.date.year,
                  message.date.month,
                  message.date.day,
                ),
                groupHeaderBuilder: (Message message) => SizedBox(
                  height: 40,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(6, 2, 6, 2),
                        child: Text(
                          DateFormat.MMMMd().format(message.date),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                itemBuilder: (context, Message message) => Align(
                  alignment: message.isSendByMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Card(
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(message.text),
                    ),
                  ),
                ),
              ),
            ),

            if (_isTyping) ...[
              const SpinKitThreeBounce(
                color: Colors.black,
                size: 18,
              ),
            ],
            // Begin Message Input
            Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, right: 50.0, bottom: 8.0),
              child: Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: TextField(
                        controller: inputCtrl,
                        focusNode: inputFocus,
                        autofocus: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                          hintText: "Type your message here...",
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                        onChanged: (text) {
                          setState(() {
                            _isTyping = text.isNotEmpty;
                          });
                        },
                        onSubmitted: (text) {
                          sendMessage(text);
                        },
                      ),
                    ),
                  ),
                  CircleAvatar(
                    child: IconButton(
                      onPressed: () {
                        sendMessage(inputCtrl.text);
                      },
                      icon: const Icon(Icons.send, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            // End Message Input
          ],
        ),
      ),
    );
  }

  sendMessage(text) {
    text = text.trim();
    Message? message;
    if (text.isNotEmpty) {
      message = Message(
        text: text,
        date: DateTime.now(),
        isSendByMe: true,
      );
    }
    setState(() {
      if (message != null) {
        messages.add(message);
      }
      _isTyping = false;
      inputCtrl.clear();
      inputFocus.requestFocus();
    });
  }
}

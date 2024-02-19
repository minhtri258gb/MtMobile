import 'message.dart';

class Contact {
  String name;
  bool isGroup;
  bool isFavorite;
  String avatarUrl;
  int avatarType; // 1: asset, 2: network
  Message? lastMessage;

  Contact({
    this.name = "",
    this.isGroup = false,
    this.isFavorite = false,
    this.avatarUrl = "",
    this.avatarType = 1,
    this.lastMessage,
  });
}

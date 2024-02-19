class Message {
  String text;
  bool isSendByMe;
  DateTime date;
  bool isReaded;

  Message(
      {this.text = "",
      this.isSendByMe = false,
      DateTime? date,
      this.isReaded = false})
      : date = date ?? DateTime.now();
}

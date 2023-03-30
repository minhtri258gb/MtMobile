import 'dart:convert';

import '../../config.dart';

class Event {
  final String title;
  final String date;
  final String imageUrl;

  static init() {
    var jsonString = '['
        '{"title":"aaa","date":"01012011","imageUrl":"localhost"},'
        '{"title":"bbb","date":"01012012","imageUrl":"localhost"},'
        '{"title":"ccc","date":"01012013","imageUrl":"localhost"}'
        ']';

    //JSON String to a map
    List<dynamic> lst = jsonDecode(jsonString);
    for (var i = 0; i < lst.length; i++) {
      Map<String, dynamic> eventMap = lst[i];
      var event = Event.fromJson(eventMap);
      if (MT.kDebugMode) {
        print("Title: " + event.title);
      }
      print("Date: " + event.date);
      print("URL: " + event.imageUrl);
    }
    //Serialize to object
    //
    //Encode to JSON String
    // String json = jsonEncode(event);

    // print(event);

    // return event;
    return 0;
  }

  Event(this.title, this.date, this.imageUrl);

  Event.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        date = json['date'],
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() =>
      {'title': title, 'date': date, 'imageUrl': imageUrl};
}

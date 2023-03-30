// ignore: file_names
import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:flutter/services.dart';
// import 'package:http/retry.dart';
import 'dart:convert' as convert;
// import 'package:http/http.dart' as http;

class RestApiPage extends StatefulWidget {
  const RestApiPage({super.key});

  @override
  State<RestApiPage> createState() => _RestApiState();
}

class _RestApiState extends State<RestApiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black87,
          ),
          onPressed: () {
            callHttp();
          },
        ),
      ),
    );
  }

  void callHttp() async {
    var url =
        Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    // var response = await http.get(url);
    // if (response.statusCode == 200) {
    //   var jsonResponse =
    //       convert.jsonDecode(response.body) as Map<String, dynamic>;
    //   var itemCount = jsonResponse['totalItems'];
    //   print('Number of books about http: $itemCount.');
    // } else {
    //   print('Request failed with status: ${response.statusCode}.');
    // }
  }
}

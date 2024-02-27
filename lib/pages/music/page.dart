import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../common/config.dart';

// Object
class MusicObject {
  final int id;
  final String name;
  final double? duration;
  final int decibel;
  final String tag;
  final bool miss;
  final int rate;

  MusicObject._({
    required this.id,
    required this.name,
    required this.duration,
    required this.decibel,
    required this.tag,
    required this.miss,
    required this.rate,
  });

  factory MusicObject.fromJson(Map<String, dynamic> json) {
    return MusicObject._(
      id: json['id'],
      name: json['name'],
      duration: json['duration'],
      decibel: json['decibel'],
      tag: json['tag'],
      miss: (json['miss'] == 1),
      rate: json['rate'],
    );
  }
}

// Manager
class MusicManager {
  List<dynamic> lstMusic = []; // list music

  void init() async {
    // API get list music
    final response = await http.post(
      Uri.parse('${Config.serverURL}/music/getListMusic'),
      headers: {"Content-Type": "application/json"},
    );

    // convert response to list music
    lstMusic = json
        .decode(response.body)['rows']
        .map((data) => MusicObject.fromJson(data))
        .toList();
  }
}

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  MusicManager mgr = MusicManager();

  List saved = <bool>[];

  @override
  void initState() {
    mgr.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text('Music'),
        ),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
      body: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black87,
              ),
              hintText: "Search you're looking for",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            child:
                // mgr.lstMusic.isEmpty
                //     ? const Center(
                //         child: CircularProgressIndicator(),
                //       )
                //     :
                ListView.builder(itemBuilder: (row, index) {
              if (index >= mgr.lstMusic.length) {
                return const ListTile(
                  title: Text(
                    '',
                    style: TextStyle(fontSize: 18.0),
                  ),
                );
              }
              var value = mgr.lstMusic[index].name;
              var isSave = saved.contains(mgr.lstMusic[index].name);
              return ListTile(
                title: Text(
                  value,
                  style: const TextStyle(fontSize: 18.0),
                ),
                trailing: isSave
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        color: null,
                      ),
                onTap: () {
                  setState(() {
                    if (isSave) {
                      saved.remove(value);
                    } else {
                      saved.add(value);
                    }
                  });
                },
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 80.0,
        child: BottomAppBar(
          // elevation: null,
          elevation: 0.0,
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow),
              ),
              IconButton(
                tooltip: 'Open popup menu',
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  final SnackBar snackBar = SnackBar(
                    content: const Text('Yay! A SnackBar!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              IconButton(
                tooltip: 'Search',
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Favorite',
                icon: const Icon(Icons.favorite),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future refresh() async {
    setState(() {
      // mgr.lstMusic =
    });
  }
}

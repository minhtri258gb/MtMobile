import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List lstData = <String>[
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
  ];

  List saved = <bool>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Center(
          child: Text('List view'),
        ),
        actions: const [
          IconButton(
              icon: Icon(Icons.search), tooltip: 'Search', onPressed: null)
        ],
      ),
      body: ListView.builder(itemBuilder: (row, index) {
        if (index >= lstData.length) {
          return const ListTile(
            title: Text(
              '',
              style: TextStyle(fontSize: 18.0),
            ),
          );
        }

        var value = lstData[index];
        var isSave = saved.contains(lstData[index]);
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
    );
  }
}

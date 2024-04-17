import 'package:flutter/material.dart';

List<String> nameList = ["Seoul", "Paris", "NewYork"];
final _filterController = TextEditingController();
int _filteredInt = 0;

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 400];

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({super.key});

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView builder Demo"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          TextField(
            controller: _filterController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: "Filter number",
            ),
            onChanged: (_) {
              setState(() {
                if (_filterController.text.isEmpty) {
                  _filteredInt = 0;
                } else {
                  _filteredInt = int.parse(_filterController.text);
                }
              });
            },
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200.0,
            child: ListView.builder(
              // shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (BuildContext context, int idx) {
                if (_filterController.text.isEmpty) {
                  _filteredInt = 0;
                } else {
                  _filteredInt = int.parse(_filterController.text);
                }

                if (idx == _filteredInt) {
                  return Container();
                } else {
                  return Text("\t\t\t$idx listed");
                }
              },
            ),
          ),
          SizedBox(
            height: 300.0,
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.amber[colorCodes[index]],
                  child: Center(child: Text('Entry ${entries[index]}')),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}

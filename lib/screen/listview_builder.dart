import 'package:flutter/material.dart';

List<String> nameList = ["Seoul", "Paris", "NewYork"];
final _filterController = TextEditingController();
int _filteredInt = 0;

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
        ],
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_my_utils/utils/my_utils.dart';

class FileOpenReadLine extends StatefulWidget {
  const FileOpenReadLine({super.key});

  @override
  State<FileOpenReadLine> createState() => _FileOpenReadLineState();
}

class _FileOpenReadLineState extends State<FileOpenReadLine> {
  String currCmd = "";
  List<String> userCmdList = [];

  String fileName = "user_cmd.txt";
  String pathStr = Directory.current.path;

  Future _getCmdList() async {
    String pathStr = Directory.current.path;
    pathStr += "\\$fileName";
    utils.log("pathStr = $pathStr");
    // myFile = File(pathStr);
    userCmdList = await File(pathStr)
        .openRead()
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .toList();

    if (userCmdList.isNotEmpty) {
      currCmd = userCmdList[0];
    } else {
      utils.log("there is no user commands");
    }

    if (userCmdList.isEmpty) {
      utils.log("userCmd is empty");
    } else {
      for (int i = 0; i < userCmdList.length; i++) {
        utils.log("userCmdList[$i] -> ${userCmdList[i]}");
      }
      setState(() {
        currCmd = userCmdList.first;
      });
      utils.log("currCmd = $currCmd");
    }
  }

  @override
  void initState() {
    super.initState();
    pathStr += "\\$fileName";

    _getCmdList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        DropdownButton(
          value: currCmd,
          items: userCmdList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              currCmd = value!;
              utils.log("onChanged : $currCmd");
            });
          },
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          // style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          // padding: const EdgeInsets.all(10),
          // isExpanded: true,
          // isDense: true,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class UserCmd {
  String? description;
  String? command;
}

class UserCmdList {
  List<UserCmd>? userCmd;
  UserCmdList({this.userCmd});

  // factory UserCmdList.fromJson(Map<String, dynamic> jsFromJson(json){});
}

class FileReadJson extends StatefulWidget {
  const FileReadJson({super.key});

  @override
  State<FileReadJson> createState() => _FileReadJsonState();
}

class _FileReadJsonState extends State<FileReadJson> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

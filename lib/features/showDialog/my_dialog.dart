import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  String title;
  String content;

  VoidCallback? yesTap;
  VoidCallback? noTap;

  MyDialog(
      {Key? key,
      required this.title,
      required this.content,
      void Function()? yesTap,
      void Function()? noTap})
      : super(key: key);

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

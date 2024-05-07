import 'package:flutter/material.dart';

Future<void> myDialog(
    {required BuildContext context,
    required String title,
    required String content,
    required String yesBtnStr,
    required String noBtnStr,
    void Function()? yesTap,
    void Function()? noTap}) {
  // String title = title;
  // String content = content;

  // VoidCallback? yesTap;
  // VoidCallback? noTap;

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          OutlinedButton(
            child: Text(yesBtnStr),
            onPressed: () {
              if (yesTap != null) yesTap();

              Navigator.pop(context);
            },
          ),
          OutlinedButton(
            child: Text(noBtnStr),
            onPressed: () {
              if (noTap != null) noTap();
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

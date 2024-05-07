import 'package:flutter/material.dart';
import 'package:flutter_my_utils/features/showDialog/my_dialog.dart';
import 'package:flutter_my_utils/utils/my_utils.dart';

class ShowDialogScreen extends StatefulWidget {
  const ShowDialogScreen({super.key});

  @override
  State<ShowDialogScreen> createState() => _ShowDialogScreenState();
}

class _ShowDialogScreenState extends State<ShowDialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("showDialog/AlertDialog"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("알림창"),
                      content: const Text("Do you really want?"),
                      actions: [
                        OutlinedButton(
                          child: const Text("OK"),
                          onPressed: () {
                            utils.log("User pressed OK");
                            Navigator.pop(context);
                          },
                        ),
                        OutlinedButton(
                          child: const Text("NO"),
                          onPressed: () {
                            utils.log("User pressed No");
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text("Open showDialog"),
            ),
            ElevatedButton(
              onPressed: () {
                myDialog(
                  context: context,
                  title: "정말로?",
                  content: "Do you really want?",
                  yesBtnStr: "응",
                  yesTap: () {
                    utils.log("응 btn");
                  },
                  noBtnStr: "아니",
                  noTap: () {
                    utils.log("아니 Btn");
                  },
                );
              },
              child: const Text("Open myDialog"),
            ),
          ],
        ),
      ),
    );
  }
}

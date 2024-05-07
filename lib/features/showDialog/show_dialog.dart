import 'package:flutter/material.dart';
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
        child: ElevatedButton(
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
      ),
    );
  }
}

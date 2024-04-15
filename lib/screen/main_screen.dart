import 'package:flutter/material.dart';
import 'package:flutter_my_utils/screen/fileio_demo.dart';
import 'package:flutter_my_utils/screen/fileio_screen.dart';
import 'package:flutter_my_utils/screen/listview_builder.dart';
import 'package:flutter_my_utils/widget/custom_button.dart';
import 'package:flutter_my_utils/widget/my_widget.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Utils"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ExpElevatedButton(
            //     title: "File IO",
            //     onPressed: () {
            //       context.push('/fileio');
            //     }),
            // ElevatedButton(
            //     onPressed: () {
            //       const FileIoScreen();
            //     },
            //     child: const Text("File IO")),
            const CustomButton(
              title: "File IO (dart:io)",
              child: FileIoScreen(),
            ),
            CustomButton(
              title: "File Picker Demo",
              child: FilePickerDemo(),
            ),
            const SizedBox(height: 20),
            const CustomButton(
              title: "ListView.Builder Demo",
              child: ListViewBuilderScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

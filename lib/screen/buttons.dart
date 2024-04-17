import 'package:flutter/material.dart';
import 'package:flutter_my_utils/utils/my_utils.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Demo'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  utils.showSnackbar(context, "ElevatedButton pressed");
                },
                child: const Text('ElevatedButton'),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  utils.showSnackbar(context, "OutlinedButton pressed");
                },
                child: const Text('OutlinedButton'),
              ),
              const SizedBox(height: 10),
              IconButton(
                onPressed: () {
                  utils.showSnackbar(context, "IconButton pressed");
                },
                icon: const Icon(Icons.alarm),
                iconSize: 50,
              ),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    utils.showSnackbar(context, "TextButton pressed");
                  },
                  child: const Text('TextButton')),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {
                  utils.showSnackbar(context, "FloatingActionButton pressed");
                },
                // child: const Text("FloatingActionButton"),
                child: const Icon(Icons.navigation),
              ),
              const SizedBox(height: 10),
              FloatingActionButton.extended(
                label: const Text("Extended FloatingActionButton"),
                onPressed: () {
                  utils.showSnackbar(context, "FloatingActionButton pressed");
                },
                // child: const Text("FloatingActionButton"),
                icon: const Icon(Icons.navigation),
              ),
              const SizedBox(height: 10),
              FilledButton(
                onPressed: () {
                  utils.showSnackbar(context, "FilledButton pressed");
                },
                child: const Text("FilledButton"),
              ),
              const SizedBox(height: 10),
              FilledButton.tonalIcon(
                onPressed: () {
                  utils.showSnackbarMs(
                      context, 200, "FilledButton.tonalIcon pressed");
                },
                icon: const Icon(Icons.color_lens),
                label: const Text("FilledButton.tonalIcon"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_utils/filesystem/my_filesystem.dart';
import 'package:flutter_my_utils/screen/fileio_open_readline.dart';
import 'package:flutter_my_utils/utils/my_utils.dart';
import 'package:flutter_my_utils/widget/my_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

MyFileSystem m_myFs = MyFileSystem();

class FileIoScreen extends StatefulWidget {
  const FileIoScreen({super.key});

  @override
  State<FileIoScreen> createState() => _FileIoScreenState();
}

class _FileIoScreenState extends State<FileIoScreen> {
  final _fileName = TextEditingController();
  final _fileWrite = TextEditingController();
  bool _binMode = false;

  File? myFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("File IO (dart:io)"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
                controller: _fileName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  // hintText: "file name",
                  labelText: "input file name",
                )),
            const SizedBox(height: 10),
            TextField(
                controller: _fileWrite,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  // hintText: "text here",
                  labelText: "input text here",
                )),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                    value: _binMode,
                    onChanged: (_) {
                      setState(() {
                        if (_binMode) {
                          _binMode = false;
                        } else {
                          _binMode = true;
                        }
                        print(
                            "mode : ${_binMode ? "binary mode" : "text mode"}");
                      });
                    }),
                Text(_binMode ? "bin mode" : "text mode"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                // const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () async {
                    myFile = File("C:\\${_fileName.text}");
                    // myFile = File(
                    //     "C:\\${DateFormat('yyyy-MM-dd_kk-mm').format(DateTime.now())}.db");
                    utils.log("Save file to ${myFile!.path.toString()}");
                    utils.log(_fileName.text.toString());
                  },
                  icon: const Icon(Icons.create),
                  label: const Text("New"),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () async {
                    myFile?.openWrite();
                  },
                  icon: const Icon(Icons.file_open),
                  label: const Text("Open"),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () async {
                    await myFile?.writeAsString(_fileWrite.text.toString(),
                        mode: FileMode.append, flush: true);
                  },
                  icon: const Icon(Icons.spellcheck),
                  label: const Text("Write"),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    if (myFile == null) {
                      utils.log("There is no opened file");
                    } else {
                      myFile = null;
                      utils.log("File closed");
                    }
                  },
                  icon: const Icon(Icons.close),
                  label: const Text("Close"),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 10),
            const FileOpenReadLine(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

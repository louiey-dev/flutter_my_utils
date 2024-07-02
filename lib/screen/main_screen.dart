import 'package:flutter/material.dart';
import 'package:flutter_my_utils/features/fileio/fileio_demo.dart';
import 'package:flutter_my_utils/features/fileio/fileio_screen.dart';
import 'package:flutter_my_utils/features/heatmap/fl_heatmap.dart';
import 'package:flutter_my_utils/features/heatmap/fluttermap_heatmap.dart';
import 'package:flutter_my_utils/features/http/http_client.dart';
import 'package:flutter_my_utils/features/showDialog/show_dialog.dart';
import 'package:flutter_my_utils/screen/buttons.dart';
import 'package:flutter_my_utils/screen/listview_builder.dart';
import 'package:flutter_my_utils/features/tcpip/tcp_socket_client.dart';
import 'package:flutter_my_utils/features/tcpip/tcp_socket_server.dart';
import 'package:flutter_my_utils/widget/custom_button.dart';

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
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      title: "File IO (dart:io)",
                      child: FileIoScreen(),
                    ),
                    SizedBox(width: 20),
                    CustomButton(
                      title: "File Picker Demo",
                      child: FilePickerDemo(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      title: "TcpIp Client Socket",
                      child: TcpClientSocket(),
                    ),
                    SizedBox(width: 20),
                    CustomButton(
                      title: "TcpIp Server Socket",
                      child: TcpServerSocket(),
                    ),
                  ],
                ),
                // const SizedBox(height: 20),
                CustomButton(
                  title: "ListView.Builder",
                  child: ListViewBuilderScreen(),
                ),
                // const SizedBox(height: 20),
                CustomButton(
                  title: "Flutter Buttons",
                  child: ButtonScreen(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      title: "fl heatmap",
                      child: FlHeatMapScreen(),
                    ),
                    SizedBox(width: 20),
                    CustomButton(
                      title: "fluttermap_heatmap",
                      child: FluttermapHeatmap(
                        title: 'Flutter_map_heatmap',
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  title: "show Dialog",
                  child: ShowDialogScreen(),
                ),
                CustomButton(
                  title: "http client",
                  child: HttpClient(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

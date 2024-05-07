import 'package:flutter/material.dart';
import 'package:flutter_my_utils/features/heatmap/fl_heatmap.dart';
import 'package:flutter_my_utils/features/heatmap/fluttermap_heatmap.dart';
import 'package:flutter_my_utils/screen/buttons.dart';
import 'package:flutter_my_utils/screen/fileio_demo.dart';
import 'package:flutter_my_utils/screen/fileio_screen.dart';
import 'package:flutter_my_utils/screen/listview_builder.dart';
import 'package:flutter_my_utils/features/tcpip/tcp_socket_client.dart';
import 'package:flutter_my_utils/features/tcpip/tcp_socket_server.dart';
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomButton(
                      title: "File IO (dart:io)",
                      child: FileIoScreen(),
                    ),
                    const SizedBox(width: 20),
                    CustomButton(
                      title: "File Picker Demo",
                      child: FilePickerDemo(),
                    ),
                  ],
                ),
                const Row(
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
                const CustomButton(
                  title: "ListView.Builder",
                  child: ListViewBuilderScreen(),
                ),
                // const SizedBox(height: 20),
                const CustomButton(
                  title: "Flutter Buttons",
                  child: ButtonScreen(),
                ),
                const Row(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

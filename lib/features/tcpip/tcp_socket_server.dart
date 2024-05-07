import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_my_utils/utils/my_utils.dart';

class TcpServerSocket extends StatefulWidget {
  const TcpServerSocket({super.key});

  @override
  State<TcpServerSocket> createState() => _TcpServerSocketState();
}

class _TcpServerSocketState extends State<TcpServerSocket> {
  final _ipAddress = TextEditingController();
  final _portNo = TextEditingController();
  final _msgSend = TextEditingController();

  List<String> msgList = [];

  bool isConnected = false;

  ServerSocket? serverSocket;
  Socket? clientSocket;

  @override
  void initState() {
    super.initState();

    _printIps();
  }

  /// get ip address via dart:io
  Future _printIps() async {
    for (var interface in await NetworkInterface.list()) {
      utils.log('== Interface: ${interface.name} ==');
      for (var addr in interface.addresses) {
        utils.log(
            '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');
      }
    }
  }

  /// get server ip address string
  String _getServerIp() {
    if (_ipAddress.text.isEmpty) {
      return "127.0.0.1";
    } else {
      return _ipAddress.text;
    }
  }

  /// get port number int
  int _getPortNo() {
    if (_portNo.text.isEmpty) {
      return 3333;
    } else {
      return (int.parse(_portNo.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TcpIp Server"),
      ),
      body: Column(
        children: [
          // Text("TcpIpServer"),
          _menuServerConfig(),
          _menuMessageSend(),
          _menuReceivedMessage(),
        ],
      ),
    );
  }

  _menuServerConfig() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Text("Server IP"),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              width: 200,
              child: TextField(
                // initialValue: "127.0.0.1",
                controller: _ipAddress,
                decoration: InputDecoration(
                    labelText: "input server ip",
                    hintText: "127.0.0.1",
                    // helperText: "127.0.0.1",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              width: 100,
              child: TextField(
                controller: _portNo,
                decoration: InputDecoration(
                    labelText: "Port No",
                    hintText: "3333",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () async {
                try {
                  if (isConnected == false) {
                    _serverStart();
                    _ipAddress.text = _getServerIp();
                    _portNo.text = _getPortNo().toString();
                  } else {
                    _serverStop();
                  }
                } catch (e) {
                  utils.log(e.toString());
                }
              },
              child: Text(isConnected ? "Stop" : "Start"),
            ),
          ),
        ],
      ),
    );
  }

  /// menu for tx message send
  _menuMessageSend() {
    return Card(
      child: ListTile(
        leading: IconButton(
          onPressed: () {
            try {
              setState(() {
                msgList.clear();
              });
            } catch (e) {
              utils.log(e.toString());
            }
          },
          icon: const Icon(Icons.cleaning_services),
        ),
        title: TextField(
          controller: _msgSend,
        ),
        trailing: IconButton(
          onPressed: () {
            try {
              _serverSendMessage(_msgSend.text);
            } catch (e) {
              utils.log(e.toString());
            }
          },
          icon: const Icon(Icons.send),
        ),
      ),
    );
  }

  /// menu to display received message from server
  _menuReceivedMessage() {
    return Expanded(
      child: SizedBox(
        height: 200,
        child: Card(
          color: Colors.yellow[200],
          child: SingleChildScrollView(
            reverse: true,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: msgList.length,
              itemBuilder: (context, int idx) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: msgList[idx].contains("tx")
                          ? Colors.amber[100]
                          : Colors.green[100]),
                  child: Text(msgList[idx]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  _serverStart() async {
    try {
      utils.log(
          "Server start with given ip, ${_getServerIp()}, ${_getPortNo()}");

      serverSocket = await ServerSocket.bind(
          InternetAddress.anyIPv4, _getPortNo(),
          shared: true);
      // utils.log(serverSocket);
      serverSocket!.listen(_handleClient);

      setState(() {
        isConnected = true;
      });
    } catch (e) {
      utils.log("Error: $e");
    }
  }

  void _handleClient(Socket client) {
    clientSocket = client;

    utils.log(
        "A new client has connected from ${clientSocket!.remoteAddress.address}:${clientSocket!.remotePort}");

    utils.log("Listening");
    clientSocket!.listen(
      (onData) {
        String rxStr = "rx => ${String.fromCharCodes(onData).trim()}";

        utils.log(rxStr);
        setState(() {
          msgList.add(rxStr);
        });
      },
      onError: (e) {
        utils.log(e.toString());
        _disconnectClient();
      },
      onDone: () {
        utils.log("Connection has terminated.");
        _disconnectClient();
      },
    );
  }

  _serverStop() {
    utils.log("server stop");

    _disconnectClient();
    if (serverSocket != null) {
      serverSocket!.close();
    }

    setState(() {
      serverSocket = null;
      isConnected = false;
    });
  }

  _disconnectClient() {
    if (clientSocket != null) {
      clientSocket!.close();
      clientSocket!.destroy();
    }

    setState(() {
      clientSocket = null;
    });
  }

  _serverSendMessage(String msg) {
    String str = "tx => $msg";
    utils.log(str);

    if (clientSocket != null) {
      clientSocket!.writeln(str);

      setState(() {
        msgList.add(str);
      });
    }
  }
}

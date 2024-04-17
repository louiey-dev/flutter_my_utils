import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_my_utils/utils/my_utils.dart';
import 'package:get_ip_address/get_ip_address.dart';

class TcpClientSocket extends StatefulWidget {
  const TcpClientSocket({super.key});

  @override
  State<TcpClientSocket> createState() => _TcpSocketState();
}

class _TcpSocketState extends State<TcpClientSocket> {
  final _ipAddress = TextEditingController();
  final _portNo = TextEditingController();
  final _msgSend = TextEditingController();
  List<String> msgList = [];

  bool isConnected = false;

  // var ipAddr = IpAddress(type: RequestType.json);
  String _myIp = "";

  Socket? sock;

  /// get ip address via get_ip_address package
  ///
  /// IP address is different with dart:io
  void _getMyIp() async {
    try {
      /// Initialize Ip Address
      var ipAddress = IpAddress(type: RequestType.json);

      /// Get the IpAddress based on requestType.
      var data = await ipAddress.getIpAddress();
      setState(() {
        _myIp = data.toString();
      });
      utils.log("IP : $_myIp");
    } on IpAddressException catch (exception) {
      /// Handle the exception.
      utils.log(exception.message);
    }
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
  void initState() {
    super.initState();
    _getMyIp();
    _printIps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tcp Client Socket"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        // scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            _menuGetServerIpPortNo(),
            const Divider(),
            _menuMessageSend(),
            const Divider(),
            _menuReceivedMessage(),
            const Divider(),
          ],
        ),
      ),
    );
  }

  /// menu to get server ip and port number
  _menuGetServerIpPortNo() {
    return Row(
      children: [
        const SizedBox(width: 10),
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
                  connectToServer(_getServerIp(), _getPortNo());
                } else {
                  disconnectServer();
                }
              } catch (e) {
                utils.log(e.toString());
              }
            },
            child: Text(isConnected ? "Disconnect" : "Connect"),
          ),
        ),
      ],
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
              sendMessage(_msgSend.text);
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
    return SizedBox(
      height: 200,
      child: Card(
        color: Colors.yellow[200],
        child: SingleChildScrollView(
          reverse: true,
          child: ListView.builder(
            shrinkWrap: true,
            // reverse: true,
            itemCount: msgList.length,
            itemBuilder: (context, int idx) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
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
    );
  }

  /// send string message to server
  sendMessage(String msg) async {
    try {
      if (sock != null) {
        utils.log("Trying to send \"$msg\"");
        // Send data to the server
        sock!.writeln(msg);
        setState(() {
          msgList.add("tx => $msg");
        });
      } else {
        utils.log("please connect to server before try to send message");
      }
    } catch (e) {
      utils.log('Error: $e');
    }
  }

  /// connect to server
  connectToServer(String serverIp, int serverPort) async {
    try {
      sock = await Socket.connect(serverIp, serverPort,
          timeout: const Duration(seconds: 15));

      setState(() {
        isConnected = true;
      });
      // Listen for data from the server
      utils.log("Listening...");
      sock!.listen(
        (data) {
          utils.log('Received from server: ${String.fromCharCodes(data)}');
          setState(() {
            msgList.add("rx => ${String.fromCharCodes(data)}");
          });
        },
        onDone: () {
          utils.log('Server disconnected.');
          sock!.destroy();
        },
        onError: (error) {
          utils.log('Error: $error');
          sock!.destroy();
          isConnected = false;
        },
      );

      // Close the socket when you're done
      // if (sock != null) {
      //   sock!.close();
      // }
    } catch (e) {
      utils.log('Error: $e');
    }
  }

  /// disconnect from server
  disconnectServer() {
    try {
      // Close the socket when you're done
      if (sock != null) {
        sock!.close();
        utils.log("Socket closed");
        setState(() {
          isConnected = false;
        });
      }
    } catch (e) {
      utils.log('Error: $e');
    }
  }
}

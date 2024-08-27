import 'package:flutter/material.dart';
import 'package:flutter_my_utils/utils/my_utils.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class HttpClient extends StatefulWidget {
  const HttpClient({super.key});

  @override
  State<HttpClient> createState() => _HttpClientState();
}

class _HttpClientState extends State<HttpClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("http client"),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            httpClientApp();
          },
          label: const Text("http client"),
        ),
      ),
    );
    // return IconButton(
    //   onPressed: () {
    //     httpClientApp();
    //   },
    //   icon: const Icon(Icons.web),
    // );
    //: const Text("http Client"));
  }
}

void httpClientApp() async {
  var url =
      Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var itemCount = jsonResponse['totalItems'];
    utils.log('Number of books about http: $itemCount.');
  } else {
    utils.log('Request failed with status: ${response.statusCode}.');
  }
}

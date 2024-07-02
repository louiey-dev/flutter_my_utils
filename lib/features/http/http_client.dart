import 'package:flutter/material.dart';
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
    print('Number of books about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

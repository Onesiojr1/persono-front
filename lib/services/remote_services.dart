import 'dart:convert';

import 'package:persono_mobile/models/post.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
var uri = Uri.parse('http://10.0.2.2:8000/blogPost');

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var response = await client.get(uri).timeout(const Duration(seconds: 3));
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }

  Future<dynamic> post(dynamic object) async {
    var _payload = json.encode(object);

    var response = await client
        .post(uri, body: _payload)
        .timeout(const Duration(seconds: 3));

    if (response.statusCode == 201) {
      return response.body;
    }
  }
}

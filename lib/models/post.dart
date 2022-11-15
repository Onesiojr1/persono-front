// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    this.id,
    required this.title,
    required this.name,
    required this.body,
    required this.category,
    required this.createdAt,
  });

  String? id;
  String title;
  String name;
  String body;
  String category;
  DateTime createdAt;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        name: json["name"],
        body: json["body"],
        category: json["category"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "name": name,
        "body": body,
        "category": category,
      };
}

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class Post extends StatelessWidget {
  final String title;
  final String body;
  final String name;
  final String category;
  final DateTime date;

  const Post(
      {super.key,
      required this.title,
      required this.body,
      required this.name,
      required this.category,
      required this.date});

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    String postDate = dateFormat.format(date);

    return Card(
      color: Color(int.parse('0xff383838')),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
            Text(
              'Por: $name - $postDate',
              style: TextStyle(color: Colors.grey[600], fontSize: 9),
            ),
            Text(
              body,
              style: TextStyle(color: Colors.grey[500], fontSize: 12),
            ),
            Chip(
              label: Text(
                category,
                style: const TextStyle(fontSize: 9, color: Colors.white),
              ),
              backgroundColor: Color(int.parse('0xff80a5e8')),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class BlogPost extends StatelessWidget {
  final String title;
  final String body;
  final String name;
  final String category;
  final DateTime date;

  const BlogPost(
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
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 350.0,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
            Text(
              'Por: $name - $postDate',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Text(
                body,
                style: TextStyle(color: Colors.grey[500], fontSize: 16),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Chip(
                  label: Container(
                    constraints: const BoxConstraints(minWidth: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          category,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Color(int.parse('0xff80a5e8')),
                  labelPadding: const EdgeInsets.fromLTRB(0, -4, 0, -4),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

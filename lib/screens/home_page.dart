import 'package:flutter/material.dart';
import 'package:persono_mobile/components/blog_post.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse('0xff2c2c2c')),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Posts',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  tooltip: 'Add a Blog Post',
                  onPressed: () {},
                  color: Colors.white,
                  iconSize: 32,
                ),
              ],
            ),
            SizedBox(
              height: 35,
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Buscar um Post',
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)),
                    contentPadding: const EdgeInsets.all(8)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Exibindo todos os Posts',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            BlogPost(
              title: 'Teste',
              body:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce suscipit turpis eu ligula tincidunt egestas.',
              name: 'Onesio',
              category: 'SONO E CIÊNCIA',
              date: DateTime.now(),
            ),
          ],
        ),
      ),
    );
  }
}

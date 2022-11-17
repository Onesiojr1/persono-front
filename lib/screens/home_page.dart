import 'package:flutter/material.dart';
import 'package:persono_mobile/components/bloc_list_post.dart';
import 'package:persono_mobile/components/list_post.dart';
import 'package:persono_mobile/screens/post_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BlocListPost bloc = BlocListPost();
  var text = 'Não há itens cadastrados';
  var input = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    if (bloc.filteredPosts == null || bloc.filteredPosts!.isEmpty) {
      text = 'Não há itens cadastrados ou itens com essa busca';
    } else if (bloc.filteredPosts!.length == bloc.posts!.length) {
      text = 'Exibindo todos os Posts';
    } else {
      text = 'Exibindo ${bloc.filteredPosts!.length} posts para: ${input.text}';
    }
    return Scaffold(
      backgroundColor: Color(int.parse('0xff2c2c2c')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 32, 12, 12),
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
                    onPressed: () => _showPostForm(context),
                    color: Colors.white,
                    iconSize: 32,
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 15),
                    Flexible(
                      fit: FlexFit.tight,
                      child: SizedBox(
                        height: 35,
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Buscar um Post',
                          ),
                          controller: input,
                          onChanged: (value) {
                            bloc.filteredPosts = bloc.posts
                                    ?.where((e) => e.title
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList() ??
                                [];
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        input.text = '';
                        bloc.filteredPosts = bloc.posts ?? [];
                        setState(() {});
                      },
                      child: AnimatedOpacity(
                        opacity: input.text.length > 0 ? 1 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: Container(
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Color(int.parse('0xff2c2c2c')),
                              borderRadius: BorderRadius.circular(16)),
                          child: const Center(
                              child: Text(
                            'Limpar',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              ListOfPosts(
                bloc: bloc,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showPostForm(BuildContext context) {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => const PostForm(),
      ),
    )
        .then((_) async {
      await bloc.getData();
      setState(() {});
    });
  }
}

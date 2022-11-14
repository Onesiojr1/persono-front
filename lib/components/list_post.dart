import 'package:flutter/material.dart';
import 'package:persono_mobile/components/blog_post.dart';
import 'package:persono_mobile/models/post.dart';
import 'package:persono_mobile/services/remote_services.dart';

class ListOfPosts extends StatefulWidget {
  const ListOfPosts({super.key});

  @override
  State<ListOfPosts> createState() => _ListOfPostsState();
}

class _ListOfPostsState extends State<ListOfPosts> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      // ignore: sort_child_properties_last
      child: ListView.builder(
        itemCount: posts?.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return BlogPost(
            title: posts![index].title,
            body: posts![index].body,
            name: posts![index].name,
            category: posts![index].category,
            date: posts![index].createdAt,
          );
        },
      ),
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

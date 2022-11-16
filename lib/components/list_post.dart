import 'package:flutter/material.dart';
import 'package:persono_mobile/components/bloc_list_post.dart';
import 'package:persono_mobile/components/blog_post.dart';
import 'package:persono_mobile/models/post.dart';
import 'package:persono_mobile/services/remote_services.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  var isLoaded = false;

  void setLoad() {
    setState(() {
      isLoaded = !isLoaded;
    });
  }
}

class ListOfPosts extends StatefulWidget {
  final BlocListPost bloc;
  const ListOfPosts({super.key, required this.bloc});

  @override
  State<ListOfPosts> createState() => _ListOfPostsState();
}

class _ListOfPostsState extends State<ListOfPosts> with Loader {
  @override
  void initState() {
    super.initState();
    widget.bloc.getData().then((value) => setLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      // ignore: sort_child_properties_last
      child: ListView.builder(
        key: Key(widget.bloc.filteredPosts?.length.toString() ?? ''),
        itemCount: widget.bloc.filteredPosts?.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return BlogPost(
            title: widget.bloc.filteredPosts?[index].title ?? '',
            body: widget.bloc.filteredPosts?[index].body ?? '',
            name: widget.bloc.filteredPosts?[index].name ?? '',
            category: widget.bloc.filteredPosts?[index].category ?? '',
            date: widget.bloc.filteredPosts?[index].createdAt ?? DateTime.now(),
          );
        },
      ),
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

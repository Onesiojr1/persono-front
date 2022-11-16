import 'package:persono_mobile/models/post.dart';
import 'package:persono_mobile/services/remote_services.dart';

class BlocListPost {
  List<Post>? posts;
  List<Post>? filteredPosts;

  Future getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      filteredPosts = [...posts!];
    } else {
      filteredPosts = [];
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_blog/model/post/post.dart';
import 'package:flutter_blog/provider/post_provider.dart';
import 'package:flutter_blog/views/pages/post/detail_page/post_detail_page.dart';
import 'package:flutter_blog/views/pages/post/list_page/components/post_list_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListBody extends ConsumerWidget {
  const PostListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostModel? model = ref.watch(postProvider);
    List<Post> posts = [];

    if (model != null) {
      posts = model.posts;
    }

    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => PostDetailPage(posts[index])),
            );
          },
          child: PostListItem(posts[index]),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
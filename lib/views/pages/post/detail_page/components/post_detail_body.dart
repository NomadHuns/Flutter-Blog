
import 'package:flutter/material.dart';
import 'package:flutter_blog/model/post/post.dart';
import 'package:flutter_blog/provider/session_provider.dart';
import 'package:flutter_blog/views/pages/post/detail_page/components/post_detail_buttons.dart';
import 'package:flutter_blog/views/pages/post/detail_page/components/post_detail_content.dart';
import 'package:flutter_blog/views/pages/post/detail_page/components/post_detail_profile.dart';
import 'package:flutter_blog/views/pages/post/detail_page/components/post_detail_title.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailBody extends ConsumerWidget {
  final Post post;

  const PostDetailBody(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser sessionUser = ref.read(sessionProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostDetailTitle(post.title),
          SizedBox(height: 20),
          PostDetailProfile(post),
          const Divider(),
          PostDetailButtons(post),
          const Divider(),
          SizedBox(height: 20),
          Expanded(child: PostDetailContent(post.content)),
        ],
      ),
    );
  }
}

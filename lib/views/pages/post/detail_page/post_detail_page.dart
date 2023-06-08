import 'package:flutter/material.dart';
import 'package:flutter_blog/model/post/post.dart';
import 'package:flutter_blog/views/pages/post/detail_page/components/post_detail_body.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;

  const PostDetailPage(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PostDetailBody(post),
    );
  }
}

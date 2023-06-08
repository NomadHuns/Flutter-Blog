import 'package:flutter/material.dart';
import 'package:flutter_blog/model/post/post.dart';
import 'package:flutter_blog/views/pages/post/update_page/components/post_update_body.dart';
import 'package:logger/logger.dart';

class PostUpdatePage extends StatelessWidget {
  final Post post;

  const PostUpdatePage(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger().d("UpdatePage");
    return Scaffold(
      appBar: AppBar(),
      body: PostUpdateBody(post),
    );
  }
}
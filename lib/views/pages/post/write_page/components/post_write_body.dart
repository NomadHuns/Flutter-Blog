import 'package:flutter/material.dart';
import 'package:flutter_blog/views/pages/post/write_page/components/post_write_form.dart';

class PostWriteBody extends StatelessWidget {
  PostWriteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: PostWriteForm(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_blog/core/constants/size.dart';
import 'package:flutter_blog/model/post/post.dart';

class PostDetailProfile extends StatelessWidget {
  final Post post;

  const PostDetailProfile(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.user.username),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(50), // 네모난 이미지를 동그랗게 만들기 위한 값 설정
        child: Image.asset('assets/default_profile.png'), // 네모난 이미지
      ),
      subtitle: Row(
        children: [
          Text(post.user.email),
          SizedBox(width: mediumGap),
          Text("·"),
          SizedBox(width: mediumGap),
          Text("Written on "),
          Text(post.getUpdated()),
        ],
      )
    );
  }
}

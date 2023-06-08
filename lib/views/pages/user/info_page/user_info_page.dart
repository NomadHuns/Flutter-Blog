import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/views/pages/user/info_page/components/user_info_appbar.dart';
import 'package:flutter_blog/views/pages/user/info_page/components/user_info_body.dart';

class UserInfoPage extends StatelessWidget {

  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://raw.githubusercontent.com/flutter-coder/ui_images/master/messenger_me.jpg"),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: UserInfoAppbar(),
        body: UserInfoBody(),
      ),
    );
  }
}

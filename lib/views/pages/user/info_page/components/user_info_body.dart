import 'package:flutter/material.dart';
import 'package:flutter_blog/views/pages/user/info_page/components/user_info_bottom_icons.dart';
import 'package:flutter_blog/views/pages/user/info_page/components/user_info_profile.dart';

class UserInfoBody extends StatelessWidget {
  const UserInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        UserInfoProfile(),
        SizedBox(height: 20),
        Divider(color: Colors.white),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 18),
          child: UserInfoBottomIcons(),
        )
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/views/components/custom_bottom_icon_button.dart';
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
          child: CustomBottomIconButton(
            icon: CupertinoIcons.pen,
            text: "프로필 편집",
          ),
        )
      ],
    );
  }
}

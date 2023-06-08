import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/views/components/custom_bottom_icon_button.dart';

class UserInfoBottomIcons extends StatelessWidget {
  const UserInfoBottomIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomBottomIconButton(
          icon: CupertinoIcons.chat_bubble,
          text: "나와의 채팅",
        ),
        SizedBox(
          width: 50,
        ),
        CustomBottomIconButton(
          icon: CupertinoIcons.pen,
          text: "프로필 편집",
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_blog/core/constants/move.dart';
import 'package:flutter_blog/core/constants/size.dart';
import 'package:flutter_blog/views/components/custom_text_button.dart';
import 'package:flutter_blog/views/components/logo.dart';
import 'package:flutter_blog/views/pages/auth/login_page/components/login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          SizedBox(height: xlargeGap),
          Logo("Blog"),
          SizedBox(height: largeGap),
          LoginForm(),
          CustomTextButton(
            "Move To Join",
            () {
              Navigator.pushNamed(context, Move.joinPage);
            },
          ),
        ],
      ),
    );
  }
}

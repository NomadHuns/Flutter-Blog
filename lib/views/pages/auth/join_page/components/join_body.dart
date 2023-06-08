import 'package:flutter/material.dart';
import 'package:flutter_blog/core/constants/move.dart';
import 'package:flutter_blog/core/constants/size.dart';
import 'package:flutter_blog/views/components/custom_text_button.dart';
import 'package:flutter_blog/views/components/logo.dart';
import 'package:flutter_blog/views/pages/auth/join_page/components/join_form.dart';

class JoinBody extends StatelessWidget {
  const JoinBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          SizedBox(height: xlargeGap),
          Logo("Blog"),
          SizedBox(height: largeGap),
          JoinForm(),
          CustomTextButton(
            "Move To Login",
                () {
              Navigator.pushNamed(context, Move.loginPage);
            },
          ),
        ],
      ),
    );
  }
}

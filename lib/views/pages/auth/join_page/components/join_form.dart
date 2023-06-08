import 'package:flutter/material.dart';
import 'package:flutter_blog/core/constants/move.dart';
import 'package:flutter_blog/core/constants/size.dart';
import 'package:flutter_blog/core/util/validator_util.dart';
import 'package:flutter_blog/views/pages/auth/components/auth_text_form_field.dart';

class JoinForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // 1. 글로벌 key
  final _usernameCon = TextEditingController();
  final _emailCon = TextEditingController();
  final _passwordCon = TextEditingController();

  JoinForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      // 2. 글로벌 key를 Form 태그에 연결하여 해당 key로 Form의 상태를 관리할 수 있다.
      key: _formKey,
      child: Column(
        children: [
          AuthTextFormField(
            text: "Username",
            obscureText: false,
            funValidator: validateUsername(),
            controller: _usernameCon,
          ),
          SizedBox(height: mediumGap),
          AuthTextFormField(
            text: "Email",
            obscureText: false,
            funValidator: validateEmail(),
            controller: _emailCon,
          ),
          SizedBox(height: mediumGap),
          AuthTextFormField(
            text: "Password",
            obscureText: true,
            funValidator: validatePassword(),
            controller: _passwordCon,
          ),
          SizedBox(height: largeGap),
          // 3. TextButton 추가
          TextButton(
            onPressed: () {
              // 4. 유효성 검사
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, Move.loginPage);
              }
            },
            child: Text("Join"),
          ),
        ],
      ),
    );
  }
}

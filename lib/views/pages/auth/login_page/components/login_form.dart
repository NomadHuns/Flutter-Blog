import 'package:flutter/material.dart';
import 'package:flutter_blog/core/constants/size.dart';
import 'package:flutter_blog/core/util/validator_util.dart';
import 'package:flutter_blog/dto/user_request.dart';
import 'package:flutter_blog/provider/user_provider.dart';
import 'package:flutter_blog/views/components/custom_auth_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>(); // 1. 글로벌 key
  final _username = TextEditingController();
  final _password = TextEditingController();

  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      // 2. 글로벌 key를 Form 태그에 연결하여 해당 key로 Form의 상태를 관리할 수 있다.
      key: _formKey,
      child: Column(
        children: [
          AuthTextFormField(
            text: "Username",
            obscureText: false,
            funValidator: validateUsername(),
            controller: _username,
          ),
          SizedBox(height: mediumGap),
          AuthTextFormField(
            text: "Password",
            obscureText: true,
            funValidator: validatePassword(),
            controller: _password,
          ),
          SizedBox(height: largeGap),
          // 3. TextButton 추가
          TextButton(
            onPressed: () {
              // 4. 유효성 검사
              if (_formKey.currentState!.validate()) {
                LoginReqDTO loginReqDTO = LoginReqDTO(username: _username.text, password: _password.text);
                ref.read(userProvider).login(loginReqDTO);
              }
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}

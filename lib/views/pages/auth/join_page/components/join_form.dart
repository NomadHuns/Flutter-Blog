import 'package:flutter/material.dart';
import 'package:flutter_blog/core/constants/move.dart';
import 'package:flutter_blog/core/constants/size.dart';
import 'package:flutter_blog/core/util/validator_util.dart';
import 'package:flutter_blog/dto/user_request.dart';
import 'package:flutter_blog/provider/user_provider.dart';
import 'package:flutter_blog/views/pages/auth/components/auth_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  JoinForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
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
            text: "Email",
            obscureText: false,
            funValidator: validateEmail(),
            controller: _email,
          ),
          SizedBox(height: mediumGap),
          AuthTextFormField(
            text: "Password",
            obscureText: true,
            funValidator: validatePassword(),
            controller: _password,
          ),
          SizedBox(height: largeGap),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                JoinReqDTO reqDTO = JoinReqDTO(username: _username.text, password: _password.text, email: _email.text);
                ref.read(userProvider).join(reqDTO);
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

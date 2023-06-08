import 'package:flutter/material.dart';
import 'package:flutter_blog/core/constants/move.dart';
import 'package:flutter_blog/core/constants/size.dart';
import 'package:flutter_blog/core/util/validator_util.dart';
import 'package:flutter_blog/dto/post_request.dart';
import 'package:flutter_blog/model/post/post.dart';
import 'package:flutter_blog/provider/post_provider.dart';
import 'package:flutter_blog/provider/session_provider.dart';
import 'package:flutter_blog/views/components/custom_elavated_button.dart';
import 'package:flutter_blog/views/components/custom_text_area.dart';
import 'package:flutter_blog/views/components/custom_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostUpdateForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();
  final Post post;

  PostUpdateForm(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          CustomTextFormField(
            controller: _title,
            initValue: post.title,
            hint: "Title",
            funValidator: validateTitle(),
          ),
          CustomTextArea(
            controller: _content,
            initValue: post.content,
            hint: "Content",
            funValidator: validateContent(),
          ),
          SizedBox(height: largeGap),
          CustomElevatedButton(
            text: "글 수정하기",
            funPageRoute: () async {
              if (_formKey.currentState!.validate()) {
                PostUpdateReqDTO reqDTO = PostUpdateReqDTO(title: _title.text, content: _content.text);
                SessionUser sessionUser = ref.read(sessionProvider);

                ref.read(postProvider.notifier).notifyUpdate(sessionUser.jwt!, post.id, reqDTO);

                Navigator.popAndPushNamed(context, Move.postListPage);
              }
            },
          ),
        ],
      ),
    );
  }
}
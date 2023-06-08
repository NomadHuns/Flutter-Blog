import 'package:flutter/material.dart';
import 'package:flutter_blog/core/constants/move.dart';
import 'package:flutter_blog/core/constants/size.dart';
import 'package:flutter_blog/core/util/validator_util.dart';
import 'package:flutter_blog/dto/post_request.dart';
import 'package:flutter_blog/views/components/custom_elavated_button.dart';
import 'package:flutter_blog/views/components/custom_text_area.dart';
import 'package:flutter_blog/views/components/custom_text_form_field.dart';
import 'package:flutter_blog/views/pages/post/list_page/post_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostWriteForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();
  PostWriteForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          CustomTextFormField(
            controller: _title,
            hint: "Title",
            funValidator: validateTitle(),
          ),
          SizedBox(height: smallGap),
          CustomTextArea(
            controller: _content,
            hint: "Content",
            funValidator: validateContent(),
          ),
          SizedBox(height: largeGap),
          CustomElevatedButton(
            text: "글쓰기",
            funPageRoute: () async {
              if (_formKey.currentState!.validate()) {
                PostSaveReqDTO reqDTO = PostSaveReqDTO(title: _title.text, content: _content.text);
                ref.read(postListPageProvider.notifier).notifyAdd(reqDTO);
                Navigator.pop(context, Move.postListPage);
              }
            },
          ),
        ],
      ),
    );
  }
}
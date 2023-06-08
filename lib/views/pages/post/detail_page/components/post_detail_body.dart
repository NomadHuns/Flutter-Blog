import 'package:flutter/material.dart';
import 'package:flutter_blog/core/constants/size.dart';
import 'package:flutter_blog/model/post/post.dart';
import 'package:flutter_blog/provider/session_provider.dart';
import 'package:flutter_blog/views/pages/post/detail_page/components/post_detail_buttons.dart';
import 'package:flutter_blog/views/pages/post/detail_page/components/post_detail_content.dart';
import 'package:flutter_blog/views/pages/post/detail_page/components/post_detail_profile.dart';
import 'package:flutter_blog/views/pages/post/detail_page/components/post_detail_title.dart';
import 'package:flutter_blog/views/pages/post/detail_page/post_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailBody extends ConsumerWidget {
  final int postId;

  const PostDetailBody(this.postId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostDetailPageModel? model = ref.watch(postDetailPageProvider(postId));
    SessionUser sessionUser = ref.read(sessionProvider);
    if(model == null){
      return const CircularProgressIndicator();
    } else {
      Post post = model.post;
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostDetailTitle(post.title),
            SizedBox(height: largeGap),
            PostDetailProfile(post),
            if (sessionUser.user!.id == post.user.id)
              PostDetailButtons(post),
            const Divider(),
            SizedBox(height: largeGap),
            Expanded(child: PostDetailContent(post.content)),
          ],
        ),
      );
    }
  }
}

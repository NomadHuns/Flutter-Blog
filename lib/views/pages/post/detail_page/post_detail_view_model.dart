import 'package:flutter/material.dart';
import 'package:flutter_blog/dto/post_request.dart';
import 'package:flutter_blog/dto/response_dto.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_blog/model/post/post.dart';
import 'package:flutter_blog/model/post/post_repository.dart';
import 'package:flutter_blog/provider/session_provider.dart';
import 'package:flutter_blog/views/pages/post/list_page/post_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final postDetailPageProvider = StateNotifierProvider.family.autoDispose<PostDetailPageProvider, PostDetailPageModel?, int>((ref, postId) {
  return PostDetailPageProvider(ref, null)..notifyInit(postId);
});

// 창고 데이터
class PostDetailPageModel{
  Post post;
  PostDetailPageModel({required this.post});
}

// 창고
class PostDetailPageProvider extends StateNotifier<PostDetailPageModel?>{
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  PostDetailPageProvider(this.ref, super.state);

  void notifyInit(int id) async {
    Logger().d("notifyInit");

    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO = await PostRepository().fetchPost(sessionUser.jwt!, id);

    state = PostDetailPageModel(post: responseDTO.data);
  }


  void notifyUpdate(int postId, PostUpdateReqDTO reqDTO) async {
    Logger().d("notifyUpdate");

    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO = await PostRepository().fetchUpdate(sessionUser.jwt!, postId, reqDTO);
    if (responseDTO.code != 1) {
      ScaffoldMessenger.of(mContext!).showSnackBar(SnackBar(content: Text("게시물 수정 실패 : ${responseDTO.msg}")));

    } else {
      ref.read(postListPageProvider.notifier).notifyUpdate(responseDTO.data);

      state = PostDetailPageModel(post: responseDTO.data);
    }
  }

}
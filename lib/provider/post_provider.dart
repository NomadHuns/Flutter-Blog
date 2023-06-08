import 'package:flutter/material.dart';
import 'package:flutter_blog/dto/post_request.dart';
import 'package:flutter_blog/dto/response_dto.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_blog/model/post/post.dart';
import 'package:flutter_blog/model/post/post_repository.dart';
import 'package:flutter_blog/provider/session_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final postProvider = StateNotifierProvider<PostProvider, PostModel?>((ref) {
  SessionUser sessionUser = ref.read(sessionProvider);
  return PostProvider(null)..notifyInit(sessionUser.jwt!);
});

// 창고 데이터
class PostModel{
  List<Post> posts;
  PostModel({required this.posts});
}

// 창고
class PostProvider extends StateNotifier<PostModel?>{
  final mContext = navigatorKey.currentContext;

  PostProvider(super.state);

  void notifyInit(String jwt) async {
    Logger().d("notifyInit");
    ResponseDTO responseDTO = await PostRepository().fetchPostList(jwt);
    state = PostModel(posts: responseDTO.data);
  }

  void notifyAdd(String jwt, PostSaveReqDTO reqDTO) async {
    Logger().d("notifyAdd");
    ResponseDTO responseDTO = await PostRepository().fetchSave(reqDTO, jwt);
    if(responseDTO.code != 1) {
      ScaffoldMessenger.of(mContext!).showSnackBar(SnackBar(content: Text("게시물 삭제 실패 : ${responseDTO.msg}")));

    } else {
      List<Post> posts = state!.posts;
      List<Post> newPosts = [responseDTO.data, ...posts];

      state = PostModel(posts: newPosts);
    }
  }

  void notifyRemove(String jwt, int id) async {
    Logger().d("notifyRemove");

    ResponseDTO responseDTO = await PostRepository().fetchDelete(id, jwt);
    if(responseDTO.code != 1) {
      ScaffoldMessenger.of(mContext!).showSnackBar(SnackBar(content: Text("게시물 삭제 실패 : ${responseDTO.msg}")));

    } else {
      List<Post> posts = state!.posts;
      List<Post> newPosts = posts.where((e) => e.id != id).toList();

      state = PostModel(posts: newPosts);

    }
  }

  void notifyUpdate(String jwt, int postId, PostUpdateReqDTO reqDTO) async {
    Logger().d("notifyUpdate");

    ResponseDTO responseDTO = await PostRepository().fetchUpdate(postId, reqDTO, jwt);
    if(responseDTO.code != 1) {
      ScaffoldMessenger.of(mContext!).showSnackBar(SnackBar(content: Text("게시물 수정 실패 : ${responseDTO.msg}")));

    } else {
      Post newPost = responseDTO.data;

      List<Post> posts = state!.posts;
      List<Post> newPosts = posts.map((e) => e.id == postId ? newPost : e).toList();

      state = PostModel(posts: newPosts);
    }
  }
}
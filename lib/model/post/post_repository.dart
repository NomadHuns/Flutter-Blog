import 'package:dio/dio.dart';
import 'package:flutter_blog/core/constants/http.dart';
import 'package:flutter_blog/dto/post_request.dart';
import 'package:flutter_blog/dto/response_dto.dart';
import 'package:flutter_blog/model/post/post.dart';
import 'package:logger/logger.dart';

class PostRepository {
  static final PostRepository _instance = PostRepository._single();

  factory PostRepository() {
    return _instance;
  }

  PostRepository._single();

  // 목적 : 통신 + 파싱
  Future<ResponseDTO> fetchPostList(String jwt) async {
    Logger().d("repository");
    try {
      Response response = await dio.get("/post",
          options: Options(headers: {"Authorization": "$jwt"}));
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      List<dynamic> mapList = responseDTO.data as List<dynamic>;
      List<Post> postList = mapList.map((e) => Post.fromJson(e)).toList();
      responseDTO.data = postList;
      return responseDTO;
    } catch (e) {
      return ResponseDTO(code: -1, msg: "실패 : ${e}");
    }
  }

  Future<ResponseDTO> fetchPost(String jwt, int id) async {
    try {
      Response response = await dio.get("/post/$id",
          options: Options(headers: {"Authorization": "$jwt"}));
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.data = Post.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(code: -1, msg: "실패 : ${e}");
    }
  }


  Future<ResponseDTO> fetchSave(String jwt, PostSaveReqDTO postSaveReqDTO) async {
    try {
      Response response = await dio.post(
          "/post",
          options: Options(headers: {"Authorization": "$jwt"}),
          data: postSaveReqDTO.toJson()
      );
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.data = Post.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(code: -1, msg: "실패 : ${e}");
    }
  }

  Future<ResponseDTO> fetchDelete(String jwt, int id) async {
    try {
      Response response = await dio.delete("/post/$id",
          options: Options(headers: {"Authorization": "$jwt"}));
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(code: -1, msg: "실패 : ${e}");
    }
  }

  Future<ResponseDTO> fetchUpdate(
      String jwt, int id, PostUpdateReqDTO postUpdateReqDTO) async {
    try {
      Response response = await dio.put(
        "/post/$id",
        options: Options(headers: {"Authorization": "$jwt"}),
        data: postUpdateReqDTO.toJson(),
      );
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.data = Post.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(code: -1, msg: "실패 : ${e}");
    }
  }
}
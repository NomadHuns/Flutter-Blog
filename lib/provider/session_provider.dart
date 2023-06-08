import 'package:flutter/material.dart';
import 'package:flutter_blog/core/constants/http.dart';
import 'package:flutter_blog/core/constants/move.dart';
import 'package:flutter_blog/dto/response_dto.dart';
import 'package:flutter_blog/dto/user_request.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_blog/model/user/user.dart';
import 'package:flutter_blog/model/user/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final sessionProvider = Provider<SessionUser>((ref) {
  return SessionUser(ref);
});

class SessionUser {
  final mContext = navigatorKey.currentContext;
  final Ref? ref;
  User? user;
  String? jwt;
  bool? isLogin;

  SessionUser(this.ref);

  void login(LoginReqDTO loginReqDTO) async {
    Logger().d("login");

    ResponseDTO responseDTO = await UserRepository().fetchLogin(loginReqDTO);

    if(responseDTO.code == 1){

      // 토큰을 휴대폰에 저장
      await secureStorage.write(key: "jwt", value: responseDTO.token);

      // 로그인 상태 등록
      loginSuccess(responseDTO.data, responseDTO.token!);

      // 페이지 이동
      Navigator.popAndPushNamed(mContext!, Move.postListPage);

    }else{

      // 실패 시 스낵바
      ScaffoldMessenger.of(mContext!).showSnackBar(SnackBar(content: Text("로그인 실패 : ${responseDTO.msg}")));
    }

  }

  void loginSuccess(User user, String jwt){
    this.user = user;
    this.jwt = jwt;
    this.isLogin = true;
  }

  Future<void> logout() async {
    this.user = null;
    this.jwt = null;
    this.isLogin = false;
    await secureStorage.delete(key: "jwt");
    Logger().d("세션 종료 및 디바이스 JWT 삭제");
  }
}
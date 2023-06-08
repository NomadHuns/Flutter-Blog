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

// 최초 앱이 실행될 때 초기화 되어야 함.
// 1. JWT 존재 유무 확인 (I/O)
// 2. JWT로 회원정보 받아봄 (I/O)
// 3. OK -> loginSuccess() 호출
// 4. FAIL -> loginPage로 이동
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

    // 통신 상태 값이 1일 경우
    if(responseDTO.code == 1){

      // 토큰을 휴대폰에 저장
      await secureStorage.write(key: "jwt", value: responseDTO.token);

      // 로그인 상태 등록
      loginSuccess(responseDTO.data, responseDTO.token!);

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

  Future<void> logoutSuccess() async {
    this.user = null;
    this.jwt = null;
    this.isLogin = false;
    await secureStorage.delete(key: "jwt");
    Logger().d("세션 종료 및 디바이스 JWT 삭제");
  }
}
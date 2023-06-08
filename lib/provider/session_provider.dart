import 'package:flutter_blog/core/constants/http.dart';
import 'package:flutter_blog/model/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final sessionProvider = Provider<SessionUser>((ref) {
  return SessionUser();
});

class SessionUser {
  User? user;
  String? jwt;
  bool? isLogin;

  SessionUser();

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
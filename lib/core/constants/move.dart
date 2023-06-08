import 'package:flutter/material.dart';
import 'package:flutter_blog/views/pages/auth/join_page/join_page.dart';
import 'package:flutter_blog/views/pages/auth/login_page/login_page.dart';
import 'package:flutter_blog/views/pages/post/list_page/post_list_page.dart';
import 'package:flutter_blog/views/pages/post/write_page/post_write_page.dart';

class Move {
  static String postListPage = "/post/list";
  static String postWritePage = "/post/write";
  static String joinPage = "/join";
  static String loginPage = "/login";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.loginPage: (context) => LoginPage(),
    Move.joinPage: (context) => JoinPage(),
    Move.postListPage: (context) => PostListPage(),
    Move.postWritePage: (context) => PostWritePage(),
  };
}
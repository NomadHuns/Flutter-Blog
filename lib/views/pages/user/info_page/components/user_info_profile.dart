import 'package:flutter/material.dart';
import 'package:flutter_blog/model/user/user.dart';
import 'package:flutter_blog/views/pages/user/info_page/user_info_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoProfile extends ConsumerWidget {
  const UserInfoProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    UserInfoPageModel? model = ref.watch(userInfoPageProvider);
    if (model == null) {
      return const CircularProgressIndicator();
    } else {
      User user = model.user;
      return Column(
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage("https://raw.githubusercontent.com/flutter-coder/ui_images/master/messenger_me.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 8),
          Text(
            user.username,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 5),
          Text(
            user.email,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      );
    }

  }
}

import 'package:flutter/material.dart';

class UserInfoProfile extends StatelessWidget {
  const UserInfoProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          "ssar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "ssar@nate.com",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

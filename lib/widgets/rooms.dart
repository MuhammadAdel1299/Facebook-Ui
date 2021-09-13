import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constants/my_colors.dart';
import 'package:untitled/model/user_model.dart';
import 'package:untitled/widgets/profile_avatar.dart';

class Rooms extends StatelessWidget {
  final List<UserModel> onlineUsers;

  const Rooms({Key? key, required this.onlineUsers}) : super(key: key);

  Widget _createRoomButton() {
    return MaterialButton(
      onPressed: () => print('Create Room'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(width: 2.0, color: Colors.blueAccent.shade100),
      ),
      textColor: MyColors.facebookColor,
      child: Row(
        children: [
          Icon(
            Icons.video_call,
            color: Colors.purpleAccent,
            size: 35.0,
          ),
          const SizedBox(width: 4.0),
          Text('Create \n Room'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
        itemCount: onlineUsers.length + 1,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: _createRoomButton(),
            );
          }
          final UserModel user = onlineUsers[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ProfileAvatar(
              image: user.image,
              isActive: true,
            ),
          );
        },
      ),
    );
  }
}

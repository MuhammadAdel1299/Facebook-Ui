import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/data/local_api.dart';
import 'package:untitled/model/user_model.dart';
import 'package:untitled/widgets/profile_avatar.dart';

class CreatePost extends StatelessWidget {
  final UserModel userModel;

  const CreatePost({Key? key, required this.userModel}) : super(key: key);

  Widget _textButton({
    required IconData icon,
    required Color iconColor,
    required Function onPressed,
    required String label,
  }) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(width: 5.0),
          Text(label, style: TextStyle(
            color: Colors.black,
          ),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(image: currentUser.image),
              const SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'What\'s in your mind ?'),
                ),
              )
            ],
          ),
          const Divider(height: 10.0, thickness: 0.5),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _textButton(
                    icon: Icons.videocam,
                    iconColor: Colors.red,
                    label: 'Live',
                    onPressed: () {
                      print('Live');
                    }
                ),
                const VerticalDivider(width: 8.0),
                _textButton(
                    icon: Icons.photo_library,
                    iconColor: Colors.green,
                    label: 'Photo',
                    onPressed: () {
                      print('Photo');
                    }
                ),
                const VerticalDivider(width: 8.0),
                _textButton(
                    icon: Icons.video_call,
                    iconColor: Colors.purpleAccent,
                    label: 'Room',
                    onPressed: () {
                      print('Room');
                    }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

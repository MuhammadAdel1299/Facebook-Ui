import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:untitled/constants/my_colors.dart';
import 'package:untitled/model/user_model.dart';
import 'package:untitled/widgets/profile_avatar.dart';

class SidePanel extends StatelessWidget {
  final UserModel currentUser;
  final List<List> panelList = [
    [Mdi.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
    [Mdi.accountMultiple, Colors.cyan, 'Friends'],
    [Mdi.facebookMessenger, MyColors.facebookColor, 'Messenger'],
    [Mdi.flag, Colors.orange, 'Pages'],
    [Mdi.storefront, MyColors.facebookColor, 'Marketplace'],
    [Icons.ondemand_video, MyColors.facebookColor, 'Watch'],
    [Mdi.calendarStar, Colors.red, 'Events'],
  ];

  SidePanel({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280.0),
      child: ListView.builder(
        itemCount: panelList.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProfileAvatar(image: currentUser.image),
                    const SizedBox(width: 6.0),
                    Flexible(
                      child: Text(
                        currentUser.name,
                        style: const TextStyle(fontSize: 16.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          final List _sidePanel = panelList[index - 1];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: _SideList(
              icon: _sidePanel[0],
              color: _sidePanel[1],
              label: _sidePanel[2],
            ),
          );
        },
      ),
    );
  }
}

class _SideList extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _SideList({
    Key? key,
    required this.icon,
    required this.color,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(icon, size: 38.0, color: color),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

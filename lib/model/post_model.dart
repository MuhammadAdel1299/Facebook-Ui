import 'package:untitled/model/user_model.dart';

class PostsModel {
  final UserModel user;
  final String caption;
  final String timeAgo;
  final String image;
  final int likes;
  final int comments;
  final int shares;


  PostsModel({
    required this.user,
    required this.caption,
    required this.timeAgo,
    required this.image,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}

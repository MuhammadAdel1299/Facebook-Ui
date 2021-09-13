import 'package:untitled/model/user_model.dart';

class StoryModel {
  final UserModel user;
  final String image;
  final bool isViewed;

  const StoryModel({
    required this.user,
    required this.image,
    this.isViewed = false,
  });
}
import 'package:Officerr/src/models/post.dart';

class User {
  final int userId;
  final String userName;
  final String email;
  final String userImageUrl;
  List<Post> posts = [];

  User(
    this.userId,
    this.userName,
    this.email, {
    this.posts,
    this.userImageUrl,
  });
}

import 'package:Officerr/src/models/comment.dart';
import 'package:flutter/material.dart';

class Post {
  final int id;
  final String name;
  final String description;
  final num rating;
  String pictureUrl;
  String thumbnailUrl;
  String videoUrl;
  List<Comment> comments;

  Post({
    @required this.id,
    @required this.name,
    @required this.description,
    this.rating = 0,
    this.comments,
    this.pictureUrl,
    this.thumbnailUrl,
    this.videoUrl,
  });
}

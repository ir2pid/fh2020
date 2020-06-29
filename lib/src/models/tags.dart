import 'package:flutter/material.dart';

class Tag {
  final int id;
  String tag;
  String thumbnailUrl;
  List<String> relatedTags;

  Tag({
    @required this.id,
    this.tag,
    this.thumbnailUrl,
    this.relatedTags,
  });
}

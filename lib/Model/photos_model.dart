import 'package:flutter/foundation.dart';

class Photos {
  final int albumId;
  final int id;
  final String title;
  final String thumbnailUrl;

  Photos({
    @required this.albumId,
    @required this.id,
    @required this.title,
    @required this.thumbnailUrl
  });

  factory Photos.fromJson(Map<String, dynamic> json) {
    return Photos(albumId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

// add url photo
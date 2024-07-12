// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Post {
  List<String>? images;
  String? content;
  String? authorName;
  Post({
    this.images,
    this.content,
    this.authorName,
  });

  Post copyWith({
    List<String>? image,
    String? content,
    String? authorName,
  }) {
    return Post(
      images: image ?? this.images,
      content: content ?? this.content,
      authorName: authorName ?? this.authorName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': images,
      'content': content,
      'authorName': authorName,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      images: map['images'] != null
          ? List<String>.from((map['images'] as List<dynamic>))
          : null,
      content: map['content'] != null ? map['content'] as String : null,
      authorName:
          map['author_name'] != null ? map['author_name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Post(image: $images, content: $content, authorName: $authorName)';

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return listEquals(other.images, images) &&
        other.content == content &&
        other.authorName == authorName;
  }

  @override
  int get hashCode => images.hashCode ^ content.hashCode ^ authorName.hashCode;
}

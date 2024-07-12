import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vixito_apper/models/api_result.dart';
import 'package:vixito_apper/models/post.dart';
import 'package:vixito_apper/models/user.dart';
import 'package:vixito_apper/services/feed_service.dart';

class FeedProvider extends ChangeNotifier {
  bool isLoadingPost = true;
  String status = "NO STATUS YET";
  List<Post> posts = [];
  List<User> friends = [];

  saveIsLoadingPost(bool value) {
    isLoadingPost = value;
    notifyListeners();
  }

  saveStatus(String value) {
    status = value;
    notifyListeners();
  }

  savePosts(List<Post> value) {
    posts = value;
    notifyListeners();
  }

  saveFriends(List<User> value) {
    friends = value;
    notifyListeners();
  }

  fetchPosts() async {
    List<Post> postTmpList = [];
    ApiResult result = await FeedService.fetchPosts();
    saveIsLoadingPost(false);
    if (result.success = true) {
      print(result.message!);
      List<dynamic> list = jsonDecode(result.response!.body) as List<dynamic>;
      saveStatus(list.length.toString());
      list.forEach((postData) {
        postTmpList.add(Post.fromMap(postData));
      });
      savePosts(postTmpList);
    } else {
      print("An Error OCCURED");
    }
  }

  fetchFriends() {}

  func() {}
}

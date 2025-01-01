import 'package:flutter/material.dart';
import '../services/posts.dart';
import '../models/post.dart';

class PostProvider with ChangeNotifier {
   Posts _service = Posts();
  List<Post> _post = [];
  bool _isLoading = false;

  List<Post> get post => _post;
  bool get isLoading => _isLoading;

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _post = await _service.fetchPosts();
    } catch (e) {
      _post = [];
    }
    _isLoading = false;
    notifyListeners();
  }
}

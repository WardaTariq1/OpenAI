import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class Posts {
  Future<List<Post>> fetchPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch posts');
    }
  }
}

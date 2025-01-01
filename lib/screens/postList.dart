import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/postsProvider.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: provider.post.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(provider.post[index].title.toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: provider.fetchPosts,
        child: Icon(Icons.refresh),
      ),
    );
  }
}

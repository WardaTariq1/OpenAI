import 'package:analyticatask/services/openAI.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/openAIProvider.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OpenAIProvider>(context);
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('OpenAI Chat')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Enter your prompt',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              provider.fetchResponse(controller.text);
            },
            child: Text('Generate Response'),
          ),
          if (provider.isLoading) CircularProgressIndicator(),
          if (!provider.isLoading && provider.response.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(provider.response),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../services/openAI.dart';

class OpenAIProvider with ChangeNotifier {
  final OpenAI _service = OpenAI();
  String _response = '';
  bool _isLoading = false;

  String get response => _response;
  bool get isLoading => _isLoading;

  Future<void> fetchResponse(String prompt) async {
    _isLoading = true;
    notifyListeners();
    try {
      _response = await _service.generateResponse(prompt);
    } catch (e) {
      _response = 'Error: ${e.toString()}';
    }
    _isLoading = false;
    notifyListeners();
  }
}

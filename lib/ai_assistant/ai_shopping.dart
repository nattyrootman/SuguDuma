import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


/*class GeminiService {
  final String apiUrl = 'https://api.gemini.com/v1/assist'; // Remplace avec le bon URL
  final String apiKey = 'TA_CLE_API'; // Remplace avec ta clé API

  Future<String> getAssistantResponse(String prompt) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'prompt': prompt,
        'model': 'latest-version', // Utilise le modèle correct selon la doc API
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['response']; // Cela dépend du format de la réponse API
    } else {
      throw Exception('Échec de la récupération des données depuis l\'API Gemini');
    }
  }
}








class AssistantScreen extends StatefulWidget {
  @override
  _AssistantScreenState createState() => _AssistantScreenState();
}

class _AssistantScreenState extends State<AssistantScreen> {
  final TextEditingController _controller = TextEditingController();
  String _response = '';

  Future<void> _getSuggestions(String prompt) async {
    try {
      final response = await GeminiService().getAssistantResponse(prompt);
      setState(() {
        _response = response;
      });
    } catch (error) {
      setState(() {
        _response = 'Erreur : $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assistant Shopping'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Demande d\'aide ou suggestions',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _getSuggestions(_controller.text);
              },
              child: Text('Afficher les suggestions'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _response.isNotEmpty ? _response : 'Aucune suggestion pour le moment',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
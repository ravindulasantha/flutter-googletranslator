import 'package:flutter/material.dart';
import 'package:translator/translator.dart'; // Import the translator package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final translator = GoogleTranslator(); // Initialize the translator
  String translatedText = ""; // Variable to store the translated text
  TextEditingController _textController = TextEditingController();

  Future<void> _translateText() async {
    // Translate the text from English to Sinhala
    final translation = await translator.translate(_textController.text, from: 'en', to: 'si');
    setState(() {
      translatedText = translation.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('English to Sinhala Translators')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'Enter English text',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _translateText,
                child: const Text('Translate to Sinhala'),
              ),
              const SizedBox(height: 16.0),
              if (translatedText.isNotEmpty) ...[
                const Text(
                  'Translated Text:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(translatedText),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

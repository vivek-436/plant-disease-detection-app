import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

// Alerts Screen Page
class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _isLoading = false;

  final GenerativeModel _model = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey:
        'AIzaSyAOlWtBMZy9CMZiyBBCrwzTO0nsgulcKZU', // Replace with your API Key
  );

  Future<void> _sendMessage(String prompt) async {
    if (prompt.trim().isEmpty) return;

    setState(() {
      _isLoading = true;
      _messages.add({'user': prompt});
    });

    try {
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      setState(() {
        _messages.add({'bot': response.text ?? "Error: No response received."});
      });
    } catch (error) {
      setState(() {
        _messages.add({'bot': 'Error: Unable to fetch response.'});
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 25,
        scrolledUnderElevation: sqrt1_2,
        backgroundColor: Colors.blueAccent,
        elevation: 4,
        title: const Text(
          'AI Chatbot',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 22.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _messages.length + (_isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _messages.length) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            'Thinking...',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                final message = _messages[index];
                final isUser = message.containsKey('user');
                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16.0),
                        topRight: const Radius.circular(16.0),
                        bottomLeft:
                            isUser ? const Radius.circular(16.0) : Radius.zero,
                        bottomRight:
                            isUser ? Radius.zero : const Radius.circular(16.0),
                      ),
                    ),
                    child: Text(
                      isUser ? message['user']! : message['bot']!,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your prompt...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed:
                      _isLoading ? null : () => _sendMessage(_controller.text),
                  style: ElevatedButton.styleFrom(
                    iconSize: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  child: const Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

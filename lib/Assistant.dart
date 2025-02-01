// chat_with_assistant_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ChatWithAssistantPage extends StatefulWidget {
  @override
  _ChatWithAssistantPageState createState() => _ChatWithAssistantPageState();
}

class _ChatWithAssistantPageState extends State<ChatWithAssistantPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  bool _isTyping = false;

  final List<String> _quickQueries = [
    "Is this product in stock?",
    "What are the available sizes?",
    "Can I get a discount?",
    "Is there a warranty?",
  ];

  void _sendMessage(String message, bool isUserMessage) {
    if (message.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': message,
          'isUser': isUserMessage,
          'time': DateFormat('h:mm a').format(DateTime.now())
        });
      });
      _messageController.clear();

      if (isUserMessage) {
        setState(() {
          _isTyping = true;
        });
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            _isTyping = false;
            _messages.add({
              'text':
                  "Thank you for your query! Our assistant will get back to you shortly.",
              'isUser': false,
              'time': DateFormat('h:mm a').format(DateTime.now())
            });
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF141E30),
        title: Text(
          'Chat with Assistant',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message['isUser']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: message['isUser']
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: message['isUser']
                              ? const Color(0xFF36D1DC)
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          message['text'],
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: message['isUser']
                                ? Colors.white
                                : Colors.black87,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(
                          message['time'],
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          if (_isTyping)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF36D1DC)),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Assistant is typing...",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _quickQueries.map((query) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.help_outline, size: 16),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5B86E5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () => _sendMessage(query, true),
                      label: Text(
                        query,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () => _sendMessage(
                    _messageController.text,
                    true,
                  ),
                  backgroundColor: const Color(0xFF36D1DC),
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

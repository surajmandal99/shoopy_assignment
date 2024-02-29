import 'package:flutter/material.dart';
import 'package:shoopy_assignment/model/chat_model.dart';

class IndividualChatScreen extends StatefulWidget {
  final ChatModel chat;

  const IndividualChatScreen({super.key, required this.chat});

  @override
  _IndividualChatScreenState createState() => _IndividualChatScreenState();
}

class _IndividualChatScreenState extends State<IndividualChatScreen> {
  final TextEditingController _textController = TextEditingController();

  List<ChatModel> _conversation = []; // Store conversation messages

  @override
  void initState() {
    super.initState();
    _conversation = [
      // Example random conversation
      ChatModel(
        name: widget.chat.name,
        imageUrl: widget.chat.imageUrl,
        message: widget.chat.message,
        dateTime: DateTime.now().subtract(const Duration(minutes: 5)),
        isRead: true,
      ),
      ChatModel(
        name: "Me",
        imageUrl: "assets/images/user.png", // Placeholder image
        message: "Hello!",
        dateTime: DateTime.now().subtract(const Duration(minutes: 2)),
        isRead: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(widget.chat.name),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _conversation.length,
              itemBuilder: (context, index) {
                final message = _conversation[index];
                final isMe = message.name == "Me";
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment:
                        isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        message.message,
                        style: TextStyle(
                          color: isMe ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14))),
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    size: 30,
                  ),
                  onPressed: () {
                    _sendMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    final messageText = _textController.text;
    if (messageText.isNotEmpty) {
      final newMessage = ChatModel(
        name: "Me",
        imageUrl: "assets/images/user.jpg", // Placeholder image
        message: messageText,
        dateTime: DateTime.now(),
        isRead: true, // Assuming the sent message is always read
      );
      setState(() {
        _conversation.add(newMessage);
      });
      _textController.clear();
    }
  }
}

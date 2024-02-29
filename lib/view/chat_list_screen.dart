import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../provider/chat_provider.dart';
import 'individual_chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: const [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.search_rounded,
                size: 30,
              ),
              SizedBox(width: 15),
              Icon(
                Icons.camera_alt_outlined,
                size: 30,
              ),
              SizedBox(width: 15),
            ],
          )
        ],
        title: const Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: chatProvider.chats.length,
        itemBuilder: (context, index) {
          final chat = chatProvider.chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(chat.imageUrl),
            ),
            title: Text(chat.name),
            subtitle: Text(chat.message),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  _formatTime(chat.dateTime),
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 5),
                chat.isRead
                    ? const Icon(Icons.check_circle_outline)
                    : const Icon(Icons.access_time),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IndividualChatScreen(chat: chat),
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat.jm().format(dateTime);
  }
}

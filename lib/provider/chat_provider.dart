// Controller
import 'package:flutter/material.dart';

import '../model/chat_model.dart';

class ChatProvider extends ChangeNotifier {
  List<ChatModel> chats = [
    ChatModel(
      name: "John Doe",
      imageUrl: "assets/images/user1.png",
      message: "Hello!",
      dateTime: DateTime.now(),
      isRead: true,
    ),
    ChatModel(
      name: "Jane Smith",
      imageUrl: "assets/images/user2.png",
      message: "Hi there!",
      dateTime: DateTime.now().subtract(const Duration(minutes: 5)),
      isRead: false,
    ),
    ChatModel(
      name: "Alice Johnson",
      imageUrl: "assets/images/user3.png",
      message: "How are you?",
      dateTime: DateTime.now().subtract(const Duration(hours: 1)),
      isRead: true,
    ),
    ChatModel(
      name: "Bob Brown",
      imageUrl: "assets/images/user4.png",
      message: "Good morning!",
      dateTime: DateTime.now().subtract(const Duration(days: 1)),
      isRead: true,
    ),
    ChatModel(
      name: "Emma Davis",
      imageUrl: "assets/images/user5.png",
      message: "Hey!",
      dateTime: DateTime.now().subtract(const Duration(days: 2)),
      isRead: false,
    ),
  ];
}

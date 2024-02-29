class ChatModel {
  final String name;
  final String imageUrl;
  final String message;
  final DateTime dateTime;
  final bool isRead;

  ChatModel({
    required this.name,
    required this.imageUrl,
    required this.message,
    required this.dateTime,
    required this.isRead,
  });
}

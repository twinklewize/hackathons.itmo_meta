class Message {
  int id;
  int senderId;
  int chatId;
  String? text;
  DateTime dateTime;

  Message({
    required this.id,
    required this.senderId,
    required this.chatId,
    required this.text,
    required this.dateTime,
  });
}

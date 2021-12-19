import 'message.dart';

class Chat {
  int id;
  List<int> userIds;
  List<Message> messages = [];
  String? name;

  Chat({
    required this.id,
    required this.userIds,
    this.name,
    required this.messages,
  });
}

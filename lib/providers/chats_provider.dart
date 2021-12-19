import 'package:flutter/material.dart';
import 'package:ict_hack/entities/message.dart';
import '../entities/chat.dart';

class ChatsProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Chat> _chats = [
    Chat(
      id: 0,
      userIds: [17],
      messages: [
        Message(
          id: 0,
          senderId: 28564,
          chatId: 0,
          text: 'Hi',
          dateTime: DateTime(2021, 12, 10, 1, 0),
        ),
        Message(
          id: 1,
          senderId: 28564,
          chatId: 0,
          text: 'How are you, my friend?',
          dateTime: DateTime(2021, 12, 10, 1, 1),
        ),
        Message(
          id: 2,
          senderId: 28564,
          chatId: 0,
          text: 'Люблю тебя, чувак',
          dateTime: DateTime(2021, 12, 10, 1, 2),
        ),
        Message(
          id: 3,
          senderId: 17,
          chatId: 0,
          text: 'И я тебя!',
          dateTime: DateTime(2021, 12, 10, 1, 3),
        ),
        Message(
          id: 4,
          senderId: 28564,
          chatId: 0,
          text: 'Что?',
          dateTime: DateTime(2021, 12, 10, 1, 4),
        ),
        Message(
          id: 5,
          senderId: 17,
          chatId: 0,
          text: 'Что?',
          dateTime: DateTime(2021, 12, 10, 1, 5),
        ),
      ],
    ),
    Chat(
      id: 0,
      userIds: [17],
      messages: [
        Message(
          id: 0,
          senderId: 28564,
          chatId: 0,
          text: 'Hi',
          dateTime: DateTime(2021, 12, 10, 1, 0),
        ),
        Message(
          id: 1,
          senderId: 28564,
          chatId: 0,
          text: 'How are you, my friend?',
          dateTime: DateTime(2021, 12, 10, 1, 1),
        ),
        Message(
          id: 2,
          senderId: 28564,
          chatId: 0,
          text: 'Люблю тебя, чувак',
          dateTime: DateTime(2021, 12, 10, 1, 2),
        ),
        Message(
          id: 3,
          senderId: 17,
          chatId: 0,
          text: 'И я тебя!',
          dateTime: DateTime(2021, 12, 10, 1, 3),
        ),
        Message(
          id: 4,
          senderId: 28564,
          chatId: 0,
          text: 'Что?',
          dateTime: DateTime(2021, 12, 10, 1, 4),
        ),
        Message(
          id: 5,
          senderId: 17,
          chatId: 0,
          text: 'Что?',
          dateTime: DateTime(2021, 12, 10, 1, 5),
        ),
      ],
    ),
  ];

  // получить список чатов, отсортированный
  // по дате и времени последнего сообщения в каждом чате
  List<Chat> get chats {
    // список чатов с сообщениями
    List<Chat> chatsWithMessages = [];

    // список чатов без сообщений
    List<Chat> chatsWithoutMessages = [];

    // итоговый списо чатов (сначала с сообщениями, потом без)
    List<Chat> resultListOfChats = [];

    // добавление каждого чата в соответствующий список
    for (var _chat in _chats) {
      if (_chat.messages.isEmpty) {
        chatsWithoutMessages.add(_chat);
      } else {
        chatsWithMessages.add(_chat);
      }
    }

    // сортировка чатов по дате последнего сообщения (если есть сообщения)
    chatsWithMessages.sort(
      (a, b) => b.messages.last.dateTime.compareTo(
        a.messages.last.dateTime,
      ),
    );

    // добавление отсортированных чатов, имеющих сообщения
    for (var chatWithMessages in chatsWithMessages) {
      resultListOfChats.add(chatWithMessages);
    }

    // добавление чатов без сообщений
    for (var chatWithoutMessages in chatsWithoutMessages) {
      resultListOfChats.add(chatWithoutMessages);
    }

    return [...resultListOfChats];
  }

  // добавлние нового сообщения в чат
  Future<void> writeMessage(
      int chatId, DateTime dateTime, String? text, int senderId) async {
    // _chats.firstWhere((chat) => chat.id == chatId).messages.add(message);
    // notifyListeners();
  }
}

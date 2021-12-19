import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../providers/chats_provider.dart';
import '../../../ui_kit/constants/app_colors.dart';

// ignore: must_be_immutable
class ChatRowItem extends StatelessWidget {
  ChatRowItem({
    required this.index,
  });

  int index;

  // разное отображение времени в зависимости от давности сообщения
  String messageDateTime(DateTime dateTime) {
    // если прошло меньше суток
    if (DateTime.now().difference(dateTime).inDays < 1) {
      return DateFormat('HH:mm').format(dateTime);
    }
    // если прошло от суток до года
    else if (DateTime.now().difference(dateTime).inDays > 1 &&
        DateTime.now().difference(dateTime).inDays < 365) {
      return DateFormat('dd.MM').format(dateTime);
    }
    // если прошло больше года
    else {
      return DateFormat('yyyy').format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    // инициализация чата со всеми его сообщениями
    var chat = Provider.of<ChatsProvider>(context).chats[index];

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 4),
      color: AppColors.chatRowBackgroundColor,
      child: Row(
        children: [
          // avatar with online indicator
          const CircleAvatar(radius: 24),

          const SizedBox(width: 12),

          // username and last message in chat with them
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // с кем чат
              const Text(
                'username',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: AppColors.chatRowTextColor,
                ),
              ),
              // последнее сообщение и его дата/время
              Container(
                width: MediaQuery.of(context).size.width * 2 / 3,
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        chat.messages.isNotEmpty
                            ? chat.messages.last.text ?? "image"
                            : '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.chatRowTextColor,
                        ),
                      ),
                    ),
                    chat.messages.isNotEmpty
                        ? Text(
                            ' · ' +
                                messageDateTime(
                                  Provider.of<ChatsProvider>(context)
                                      .chats[index]
                                      .messages
                                      .last
                                      .dateTime,
                                ),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.chatRowTextColor,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

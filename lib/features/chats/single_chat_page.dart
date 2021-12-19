import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../entities/message.dart';
import '../../providers/chats_provider.dart';
import '../../providers/user_provider.dart';
import '../../ui_kit/constants/app_colors.dart';
import '../../ui_kit/widgets/textfield.dart';
import 'components/info_bubble_item.dart';
import 'components/message_item.dart';

// ignore: must_be_immutable
// пришлось делать stateful, чтобы реализовать прокрутку
// до последнего сообщения при открытии диалога
class ChatScreen extends StatefulWidget {
  ChatScreen({
    required this.chatId,
  });

  // id данного чата. По нему ищется вся информация о собеседнике, сообщениях
  final int chatId;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // контроллер для ввода текста сообщения
  TextEditingController messageEditingController = TextEditingController();

  // контроллер для скролла при открытии диалога
  ScrollController listScrollController = ScrollController();

  // переменная, отвественная за активность кнопки отправки
  bool isSendButtonEnable = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => scrollToBottom(1));
  }

  @override
  void dispose() {
    messageEditingController.dispose();
    listScrollController.dispose();
    super.dispose();
  }

  // метод скролла к последнему сообщению
  void scrollToBottom(int speedInMilliseconds) {
    if (listScrollController.hasClients) {
      final bottomOffset = listScrollController.position.minScrollExtent;
      listScrollController.animateTo(
        bottomOffset,
        duration: Duration(milliseconds: speedInMilliseconds),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // инициализация чата со всеми его сообщениями
    var chat = Provider.of<ChatsProvider>(context)
        .chats
        .firstWhere((chat) => chat.id == widget.chatId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'xxx_username_xxx',
          style: const TextStyle(
              // color: Colors.black,
              ),
        ),
        backgroundColor: AppColors.primary,
      ),
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // messages list
              Expanded(
                child: chat.messages.isNotEmpty
                    ? GroupedListView<Message, DateTime?>(
                        padding: const EdgeInsets.only(bottom: 12.5, top: 20),
                        reverse: true,
                        sort: false,
                        elements: chat.messages.isNotEmpty
                            ? chat.messages.reversed.toList()
                            : chat.messages,
                        // elements: chat.messages,
                        controller: listScrollController,
                        order: GroupedListOrder.ASC,
                        groupBy: (Message element) => DateTime(
                          element.dateTime.year,
                          element.dateTime.month,
                          element.dateTime.day,
                        ),
                        groupSeparatorBuilder: (DateTime? dateTime) =>
                            InfoBubbleItem(
                          text: (dateTime!.year == DateTime.now().year)
                              ? DateFormat('dd.MM').format(dateTime)
                              : DateFormat('dd.MM.yyyy').format(dateTime),
                        ),
                        itemBuilder: (context, message) => Container(
                          child: MessageItemV2(
                            message: message,
                          ),
                          color: Colors.transparent,
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(30),
                        child: Center(
                          child: Text(
                            'No messages found. You can start a dialog now',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
              ),

              //  bottom bar with textfield
              Stack(
                children: [
                  Container(
                    child: SafeArea(
                      top: false,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(width: 15),

                            // picture icon
                            SizedBox(
                              height: 44,
                              child: SvgPicture.asset(
                                  'assets/icons/picture_icon.svg'),
                            ),

                            const SizedBox(width: 10),

                            // camera icon
                            GestureDetector(
                              onTap: () {},
                              child: const SizedBox(
                                height: 44,
                                child: Icon(
                                  Icons.camera_alt,
                                ),
                              ),
                            ),

                            const SizedBox(width: 15),

                            // write message textfield
                            Expanded(
                              child: SizedBox(
                                child: MyTextField(
                                  onChanged: (value) {
                                    print(value);
                                  },
                                  controller: messageEditingController,
                                  fillColor: AppColors.backgroundLight,
                                  labelText: "Начните писать",
                                  keyboardType: TextInputType.text,
                                  maxLines: 6,
                                  minLines: 1,
                                  inputTextColor: Colors.black,
                                ),
                              ),
                            ),

                            const SizedBox(width: 15),

                            // send button
                            GestureDetector(
                              onTap: () async {
                                isSendButtonEnable
                                    ? {
                                        Provider.of<ChatsProvider>(context,
                                                listen: false)
                                            .writeMessage(
                                          widget.chatId,
                                          DateTime.now(),
                                          messageEditingController.text,
                                          Provider.of<UserProvider>(context,
                                                  listen: false)
                                              .userEntity
                                              .id,
                                        ),
                                        messageEditingController.clear(),
                                        setState(() {
                                          isSendButtonEnable = false;
                                        }),
                                        await Future.delayed(
                                          const Duration(
                                            milliseconds: 100,
                                          ),
                                        ),
                                        scrollToBottom(100),
                                      }
                                    : print('сначала введите сообщение');
                              },
                              child: Container(
                                color: Colors.transparent,
                                height: 44,
                                child: const Icon(Icons.send),
                              ),
                            ),

                            const SizedBox(width: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

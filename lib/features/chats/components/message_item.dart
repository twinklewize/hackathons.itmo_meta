import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../entities/message.dart';
import '../../../providers/user_provider.dart';
import '../../../ui_kit/constants/app_colors.dart';

// вовзращает сообщение (от меня или от собеседника)
// виджет одного сообщения и диалога для него
// Пришлось сделать stateful, чтобы динамически высчитывать размер сообщения
// (для отображения диалога в нужном месте)
class MessageItemV2 extends StatefulWidget {
  MessageItemV2({
    required this.message,
  });

  final Message message;

  @override
  State<MessageItemV2> createState() => _MessageItemV2State();
}

class _MessageItemV2State extends State<MessageItemV2> {
  // single message from me or opponent
  Widget messageItem(BuildContext context) {
    return
        // проверка на то, являюсь ли я отправителем
        widget.message.senderId ==
                Provider.of<UserProvider>(context).userEntity.id
            ?
            // сообщение от меня
            Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.787,
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                          color: AppColors.primary,
                          child: Stack(
                            children: <Widget>[
                              // text (real + placeholder)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      //real message
                                      TextSpan(
                                        text: widget.message.text ??
                                            '  ' + "       ",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),

                                      //fake additionalInfo as placeholder
                                      TextSpan(
                                        text: DateFormat("HH:mm")
                                            .format(widget.message.dateTime),
                                        style: const TextStyle(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // real additionalInfo
                              Positioned(
                                child: Row(
                                  children: [
                                    Text(
                                      DateFormat("HH:mm")
                                          .format(widget.message.dateTime),
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: AppColors.myMessageDateTimeColor,
                                      ),
                                    ),
                                  ],
                                ),
                                right: 8.0,
                                bottom: 4.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            :

            // сообщение от собеседника
            Stack(
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // bubble
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.787,
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                              color: Colors.white,
                              child: Stack(
                                children: <Widget>[
                                  // text (real + placeholder)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          //real message
                                          TextSpan(
                                            text: widget.message.text ??
                                                '' + "   ",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),

                                          //fake additionalInfo as placeholder
                                          TextSpan(
                                            text: DateFormat("HH:mm").format(
                                                widget.message.dateTime),
                                            style: const TextStyle(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  //real additionalInfo
                                  Positioned(
                                    child: Text(
                                      DateFormat("HH:mm")
                                          .format(widget.message.dateTime),
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(109, 120, 133, 1),
                                      ),
                                    ),
                                    right: 8.0,
                                    bottom: 4.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
  }

  @override
  Widget build(BuildContext context) {
    return messageItem(context);
  }
}

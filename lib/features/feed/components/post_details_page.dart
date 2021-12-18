import 'package:flutter/material.dart';
import '../../../entities/post.dart';
import '../../../ui_kit/widgets/textfield.dart';
import 'message_bubble_widget.dart';
import 'post_item.dart';

class PostDetailsPage extends StatelessWidget {
  PostDetailsPage({
    Key? key,
    required this.post,
  }) : super(key: key);

  Post post;
  TextEditingController writeCommentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text(post.title),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PostItem(post: post),

            const SizedBox(height: 25),

            const Text(
              '4 Comments',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 12),

            // comments
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  MessageBubbleWidget(
                    msg:
                        'Yea, I have bought a 10 top new coins for our Finance Department. ',
                    formattedDateTime: '23 Nov 19:34',
                    senderId: 'notmyId',
                  ),
                  MessageBubbleWidget(
                    msg: 'ok',
                    formattedDateTime: '23 Nov 19:34',
                    senderId: 'notmyId',
                  ),
                  MessageBubbleWidget(
                    msg:
                        'We are inspired and improved at international professional exhibitions and specialized events. We personally communicate with representatives of exclusive furniture brands and often use furniture made according to individual sketches in our projects.',
                    formattedDateTime: '23 Nov 19:34',
                    senderId: 'notmyId',
                  ),
                  MessageBubbleWidget(
                    msg: 'Good Job! It’s my comment.',
                    formattedDateTime: '23 Nov 19:34',
                    senderId: 'myId',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // new comment textfeild
            Container(
              child: SafeArea(
                top: false,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 15),

                      // add button
                      GestureDetector(
                        onTap: () async {
                          print('сначала введите сообщение');
                        },
                        child: const Icon(
                          Icons.add_circle,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(width: 15),

                      // write message textfield
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: Colors.grey[500],
                              borderRadius: BorderRadius.circular(10)),
                          child: MyTextField(
                            onChanged: (value) {},
                            controller: writeCommentController,
                            fillColor: const Color.fromRGBO(44, 45, 46, 1),
                            labelText: 'Comment',
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.send,
                            maxLines: 4,
                            minLines: 1,
                            inputTextColor: Colors.white,
                          ),
                        ),
                      ),

                      SizedBox(width: 15),

                      // send button
                      GestureDetector(
                        onTap: () async {
                          print('сначала введите сообщение');
                        },
                        child: const Icon(
                          Icons.send_rounded,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(width: 15),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

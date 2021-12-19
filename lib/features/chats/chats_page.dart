import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/chats_provider.dart';
import '../../ui_kit/constants/app_colors.dart';
import 'components/chat_row_item.dart';
import 'single_chat_page.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: const Text(
        'Чаты',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: AppColors.primary,
    );
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          // список чатов
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: Provider.of<ChatsProvider>(context).chats.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  // открытие страницы чата
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => ChatScreen(
                        chatId: Provider.of<ChatsProvider>(
                          context,
                          listen: false,
                        ).chats[index].id,
                      ),
                    ),
                  );
                },
                child: ChatRowItem(index: index),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_sharp),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}

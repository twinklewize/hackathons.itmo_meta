import 'package:flutter/material.dart';
import 'package:ict_hack/features/account/components/my_post_item.dart';
import 'package:ict_hack/providers/my_account_provider.dart';
import 'package:ict_hack/ui_kit/half_long_button.dart';
import 'package:provider/provider.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: const Text('Мой профиль'),
      actions: [
        Row(
          children: [
            Text('1000' + ' 🪙'),
            SizedBox(width: 12),
            Text('35' + ' 💎'),
            SizedBox(width: 12),
          ],
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width - 24,
                height: MediaQuery.of(context).size.width - 24,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 24),
            Divider(thickness: 1),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "xxx_nagibatel_3000_xxx",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'изм.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Text(
                      "Ваш номер в ИСУ:",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      '285442',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'выйти',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(thickness: 1),
            SizedBox(height: 24),
            for (var post in Provider.of<MyAccountProvider>(context).posts)
              MyPostItem(post: post),
          ],
        ),
      ),
    );
  }
}

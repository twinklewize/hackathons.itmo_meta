import 'package:flutter/material.dart';
import 'package:ict_hack/features/account/components/my_post_item.dart';
import 'package:ict_hack/features/custom_avatar/custom_avatar_view.dart';
import 'package:ict_hack/providers/my_account_provider.dart';
import 'package:ict_hack/providers/user_provider.dart';
import 'package:ict_hack/ui_kit/widgets/custom_avatar.dart';
import 'package:provider/provider.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).userEntity;
    var appBar = AppBar(
      title: const Text('Мой профиль'),
      actions: [
        Row(
          children: const [
            Text('1000 🪙'),
            SizedBox(width: 12),
            Text('35 💎'),
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
            CustomAvatar(
              avatarHeight: MediaQuery.of(context).size.width - 24,
              userAvatar: user.userAvatar,
            ),
            const SizedBox(height: 24),
            const Divider(thickness: 1),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user.nickname,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => CustomAvatarView(
                              newAvatar: false,
                              nick: user.nickname,
                            ),
                          ),
                        );
                      },
                      child: const Text(
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
            const Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Text(
                      "Ваш номер в ИСУ:",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      user.id.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
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
            const Divider(thickness: 1),
            const SizedBox(height: 24),
            for (var post in Provider.of<MyAccountProvider>(context).posts)
              MyPostItem(post: post),
          ],
        ),
      ),
    );
  }
}

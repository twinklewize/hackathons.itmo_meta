import 'package:flutter/material.dart';
import 'package:ict_hack/features/feed/components/post_details_page.dart';
import 'package:ict_hack/providers/my_feed_provider.dart';
import 'package:provider/provider.dart';

import '../../ui_kit/constants/app_colors.dart';
import '../feed/components/post_item.dart';
import 'package:ict_hack/features/custom_avatar/custom_avatar_view.dart';
import 'package:ict_hack/providers/user_provider.dart';
import 'package:ict_hack/ui_kit/constants/app_colors.dart';
import 'package:ict_hack/ui_kit/widgets/custom_avatar.dart';

import 'components/achivments_view.dart';
import 'components/inventory.dart';
import 'components/rating_view.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).userEntity;
    var appBar = AppBar(
      title: const Text('Мой профиль'),
      backgroundColor: AppColors.primary,
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

            // Редактор персонажа
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
                        'изменить',
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
            const Divider(height: 1),

            // ИСУ
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
            const Divider(height: 1),

            // Инвентарь
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => showInventoryBottomSheet(context),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Инвентарь",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(height: 1),

            // Достижения
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => showAchivmentsBottomSheet(context),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Ваши достижения",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(height: 1),

            // Рейтинг
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => showRatingBottomSheet(context),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Рейтинг пользователей",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const Divider(thickness: 1, height: 1),
            const SizedBox(height: 24),
            for (var post in Provider.of<MyFeedProvider>(context).posts)
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          PostDetailsPage(post: post),
                    ),
                  );
                },
                child: PostItem(post: post),
              ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showInventoryBottomSheet(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return showModalBottomSheet(
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: (mediaQuery.size.height - mediaQuery.padding.top) /
              mediaQuery.size.height,
          child: TabsWithInventoryElements(),
        );
      },
    );
  }

  Future<dynamic> showAchivmentsBottomSheet(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return showModalBottomSheet(
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: (mediaQuery.size.height - mediaQuery.padding.top) /
              mediaQuery.size.height,
          child: Container(
            height: 100,
            width: 100,
            child: AchivmentsView(),
          ),
        );
      },
    );
  }

  Future<dynamic> showRatingBottomSheet(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return showModalBottomSheet(
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: (mediaQuery.size.height - mediaQuery.padding.top) /
              mediaQuery.size.height,
          child: RatingView(),
        );
      },
    );
  }
}

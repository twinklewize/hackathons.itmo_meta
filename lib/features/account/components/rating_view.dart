import 'package:flutter/material.dart';
import 'package:ict_hack/ui_kit/widgets/custom_avatar.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';
import '../../../ui_kit/avatar/achievment_information.dart';
import '../../../ui_kit/constants/app_colors.dart';
import '../../../ui_kit/half_long_button.dart';
import '../../../ui_kit/universal_moodal_bottom_sheet.dart';
import '../../../ui_kit/widgets/custom_text_field.dart';

class RatingView extends StatelessWidget {
  const RatingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).userEntity;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              const Text(
                'Рейтинг друзей',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => onNewFriendButton(context),
                child: const Text(
                  'Добавить',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: AchievmentInformation.achievments.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                height: 92,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: index == 0
                      ? AppColors.yellow.withOpacity(0.75)
                      : (index == 1
                          ? AppColors.green.withOpacity(0.5)
                          : (index == 2
                              ? AppColors.blue.withOpacity(0.5)
                              : AppColors.backgroundLight)),
                ),
                child: Row(
                  children: [
                    // Картинка
                    Container(
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                          color: AppColors.textColor.withOpacity(0.15),
                          blurRadius: 2,
                          offset: const Offset(-2, 2),
                        )
                      ]),
                      child: CustomAvatar(
                        userAvatar: user.userAvatar,
                        avatarHeight: 64,
                      ),
                    ),
                    const SizedBox(width: 32),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Имя пользователя
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              (32 + 120 + 32 + 16),
                          child: Text(
                            // user.nickname,
                            'Twinklewize',
                            style: const TextStyle(
                              color: AppColors.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Очки опыта
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              (32 + 120 + 32 + 16),
                          child: Text(
                            'Опыт:  2566',
                            style: TextStyle(
                              color: AppColors.textColor.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),

                    // место
                    Text(
                      '#${index + 1}',
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  void onNewFriendButton(BuildContext context) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return UniversaModalBottomSheet(
          color: AppColors.backgroundLight,
          title: "Добавить друга",
          content: Column(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextField(
                  controller: TextEditingController(),
                  textInputType: TextInputType.number,
                  hintText: 'ИСУ:',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: HalfLongButton(
                      fillColor: AppColors.red,
                      titleTextColor: Colors.white,
                      title: 'Нет',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: HalfLongButton(
                      fillColor: AppColors.green,
                      titleTextColor: Colors.white,
                      title: 'Да',
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

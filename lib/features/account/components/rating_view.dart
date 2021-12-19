import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ict_hack/ui_kit/widgets/custom_avatar.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';
import '../../../ui_kit/avatar/achievment_information.dart';
import '../../../ui_kit/constants/app_colors.dart';

class RatingView extends StatelessWidget {
  const RatingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).userEntity;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            'Рейтинг друзей',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        // const Divider(height: 1),
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
                  color: AppColors.backgroundLight,
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
}

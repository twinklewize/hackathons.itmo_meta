import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';
import '../../../ui_kit/avatar/achievment_information.dart';
import '../../../ui_kit/constants/app_colors.dart';

class AchivmentsView extends StatelessWidget {
  const AchivmentsView({Key? key}) : super(key: key);

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
            'Достижения',
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
                width: MediaQuery.of(context).size.width - 16,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.backgroundLight,
                ),
                child: Row(
                  children: [
                    // Картинка
                    achievmentImage(index, user.achievments.contains(index)),
                    const SizedBox(width: 32),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Заголовок достижения
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              (32 + 120 + 32 + 16),
                          child: Text(
                            AchievmentInformation.achievments[index].title,
                            style: const TextStyle(
                              color: AppColors.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Текст Достижения и иконка замка
                        user.achievments.contains(index)
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    (32 + 120 + 32 + 16),
                                child: Text(
                                  AchievmentInformation.achievments[index].text,
                                  style: TextStyle(
                                    color: AppColors.textColor.withOpacity(0.5),
                                  ),
                                ),
                              )
                            : SvgPicture.asset(
                                'assets/icons/lock_icon.svg',
                                height: 48,
                              ),
                      ],
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

  ClipRRect achievmentImage(int index, bool isCompleted) {
    if (isCompleted) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 120,
          width: 120,
          child: Image.asset(
            AchievmentInformation.achievments[index].imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 120,
        width: 120,
        child: ColorFiltered(
          colorFilter: const ColorFilter.mode(
            Colors.grey,
            BlendMode.saturation,
          ),
          child: Image.asset(
            AchievmentInformation.achievments[index].imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

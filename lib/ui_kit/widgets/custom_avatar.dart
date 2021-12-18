import 'package:flutter/material.dart';
import 'package:ict_hack/entities/user_avatar_entity.dart';

import '../avatar/user_avatar_assets.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    Key? key,
    this.avatarHeight = 48,
    required this.userAvatar,
  }) : super(key: key);

  final UserAvatarEntity userAvatar;
  final double avatarHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      height: avatarHeight,
      width: avatarHeight,
      decoration: BoxDecoration(
        color: UserAvatarAssets.backgroundColors[userAvatar.backgroundColorId],
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          // Тело
          Positioned(
            left: 0.125 * avatarHeight,
            right: 0.125 * avatarHeight,
            top: 0.1 * avatarHeight,
            height: 0.8 * avatarHeight,
            child: Image.asset(UserAvatarAssets.bodies[userAvatar.bodyId]),
          ),

          // Румяна
          Positioned(
            left: 0.125 * avatarHeight,
            right: 0.125 * avatarHeight,
            height: 0.35 * avatarHeight,
            top: 0.15 * avatarHeight,
            child: Image.asset(UserAvatarAssets.blush),
          ),

          // Рот
          Positioned(
            left: 0.125 * avatarHeight,
            right: 0.125 * avatarHeight,
            height: 0.11 * avatarHeight,
            top: 0.41 * avatarHeight,
            child: Image.asset(UserAvatarAssets.mouths[userAvatar.mouthId]),
          ),

          // Глаза
          Positioned(
            left: 0.125 * avatarHeight,
            right: 0.125 * avatarHeight,
            height: 0.1 * avatarHeight,
            top: 0.28 * avatarHeight,
            child: Image.asset(UserAvatarAssets.eyes[userAvatar.eyesId]),
          ),

          // Брови
          Positioned(
            left: 0.125 * avatarHeight,
            right: 0.125 * avatarHeight,
            height: 0.038 * avatarHeight,
            top: 0.24 * avatarHeight,
            child: Image.asset(UserAvatarAssets.brows[userAvatar.browsId]),
          ),

          // Очки
          userAvatar.glassesId != -1
              ? Positioned(
                  left: 0.125 * avatarHeight,
                  right: 0.125 * avatarHeight,
                  height: 0.14 * avatarHeight,
                  top: 0.26 * avatarHeight,
                  child: Image.asset(
                      UserAvatarAssets.glasses[userAvatar.glassesId]),
                )
              : const SizedBox(),

          // Волосы
          userAvatar.hairstyleId != -1
              ? Positioned(
                  left: 0.125 * avatarHeight,
                  right: 0.125 * avatarHeight,
                  height: 0.26 * avatarHeight,
                  top: 0.07 * avatarHeight,
                  child: Image.asset(
                      UserAvatarAssets.hairstyles[userAvatar.hairstyleId]),
                )
              : const SizedBox(),

          // Объем волос
          Positioned(
            left: 0.125 * avatarHeight,
            right: 0.125 * avatarHeight,
            height: 0.15 * avatarHeight,
            top: 0.03 * avatarHeight,
            child: Image.asset(UserAvatarAssets.hairVolume),
          ),

          // Обувь
          userAvatar.hairstyleId != -1
              ? Positioned(
                  left: 0.125 * avatarHeight,
                  right: 0.125 * avatarHeight,
                  height: 0.03 * avatarHeight,
                  top: 0.84 * avatarHeight,
                  child:
                      Image.asset(UserAvatarAssets.boots[userAvatar.bootsId]),
                )
              : const SizedBox(),

          // Штаны
          userAvatar.hairstyleId != -1
              ? Positioned(
                  left: 0.125 * avatarHeight,
                  right: 0.125 * avatarHeight,
                  height: 0.15 * avatarHeight,
                  top: 0.7 * avatarHeight,
                  child: Image.asset(UserAvatarAssets.pants[0]),
                )
              : const SizedBox(),

          // Футболка
          userAvatar.hairstyleId != -1
              ? Positioned(
                  left: 0.134 * avatarHeight,
                  right: 0.125 * avatarHeight,
                  height: 0.228 * avatarHeight,
                  top: 0.49 * avatarHeight,
                  child: Image.asset(
                      UserAvatarAssets.tShirts[userAvatar.tShirtId]),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:itmo_meta/ui_kit/avatar/user_avatar_assets.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    Key? key,
    this.avatarHeight = 48,
    required this.backgroundColorId,
    this.bodyId = 0,
    this.browsId = 0,
    this.eyesId = 0,
    this.hairstyleId = 0,
    this.mouthId = 0,
    this.tShirtId = 0,
    this.pantsId = 0,
    this.bootsId = 0,
    this.glassesId = -1,
  }) : super(key: key);

  final double avatarHeight;

  final int backgroundColorId;
  final int bodyId;
  final int browsId;
  final int eyesId;
  final int hairstyleId;
  final int mouthId;

  final int pantsId;
  final int tShirtId;
  final int bootsId;
  final int glassesId;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: avatarHeight,
      width: avatarHeight,
      decoration: BoxDecoration(
        color: UserAvatarAssets.backgroundColors[backgroundColorId],
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
            child: Image.asset(UserAvatarAssets.bodies[bodyId]),
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
            child: Image.asset(UserAvatarAssets.mouths[mouthId]),
          ),

          // Глаза
          Positioned(
            left: 0.125 * avatarHeight,
            right: 0.125 * avatarHeight,
            height: 0.1 * avatarHeight,
            top: 0.28 * avatarHeight,
            child: Image.asset(UserAvatarAssets.eyes[eyesId]),
          ),

          // Брови
          Positioned(
            left: 0.125 * avatarHeight,
            right: 0.125 * avatarHeight,
            height: 0.038 * avatarHeight,
            top: 0.24 * avatarHeight,
            child: Image.asset(UserAvatarAssets.brows[browsId]),
          ),

          // Очки
          glassesId != -1
              ? Positioned(
                  left: 0.125 * avatarHeight,
                  right: 0.125 * avatarHeight,
                  height: 0.14 * avatarHeight,
                  top: 0.26 * avatarHeight,
                  child: Image.asset(UserAvatarAssets.glasses[glassesId]),
                )
              : const SizedBox(),

          // Волосы
          hairstyleId != -1
              ? Positioned(
                  left: 0.125 * avatarHeight,
                  right: 0.125 * avatarHeight,
                  height: 0.26 * avatarHeight,
                  top: 0.07 * avatarHeight,
                  child: Image.asset(UserAvatarAssets.hairstyles[hairstyleId]),
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
          hairstyleId != -1
              ? Positioned(
                  left: 0.125 * avatarHeight,
                  right: 0.125 * avatarHeight,
                  height: 0.03 * avatarHeight,
                  top: 0.84 * avatarHeight,
                  child: Image.asset(UserAvatarAssets.boots[bootsId]),
                )
              : const SizedBox(),

          // Штаны
          hairstyleId != -1
              ? Positioned(
                  left: 0.125 * avatarHeight,
                  right: 0.125 * avatarHeight,
                  height: 0.15 * avatarHeight,
                  top: 0.7 * avatarHeight,
                  child: Image.asset(UserAvatarAssets.pants[0]),
                )
              : const SizedBox(),

          // Футболка
          hairstyleId != -1
              ? Positioned(
                  left: 0.134 * avatarHeight,
                  right: 0.125 * avatarHeight,
                  height: 0.228 * avatarHeight,
                  top: 0.49 * avatarHeight,
                  child: Image.asset(UserAvatarAssets.tShirts[tShirtId]),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

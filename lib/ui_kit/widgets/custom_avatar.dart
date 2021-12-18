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
    this.glassesId = -1,
    this.pantsId = 0,
    this.tShirtId = 0,
    this.bootsId = 0,
  }) : super(key: key);

  final double avatarHeight;

  final int backgroundColorId;
  final int bodyId;
  final int browsId;
  final int eyesId;
  final int hairstyleId;

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
          Positioned(
            left: avatarHeight / 8,
            right: avatarHeight / 8,
            top: avatarHeight / 8,
            bottom: avatarHeight / 8,
            child: Image.asset(UserAvatarAssets.bodies[bodyId]),
          ),
          Positioned(
            left: 0.125 * avatarHeight,
            right: 0.125 * avatarHeight,
            height: 0.125 * avatarHeight,
            top: 0.25 * avatarHeight,
            child: Image.asset(UserAvatarAssets.nose),
          ),
          Positioned(
            left: 0.125 * avatarHeight,
            right: 0.125 * avatarHeight,
            height: 0.125 * avatarHeight,
            top: 0.35 * avatarHeight,
            child: Image.asset(UserAvatarAssets.mouth),
          ),
          Positioned(
            left: 0.125 * avatarHeight,
            right: 0.125 * avatarHeight,
            height: 0.125 * avatarHeight,
            top: 0.35 * avatarHeight,
            child: Image.asset(UserAvatarAssets.blush),
          ),
        ],
      ),
    );
  }
}

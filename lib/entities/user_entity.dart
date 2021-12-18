import 'package:ict_hack/entities/user_avatar_entity.dart';

class UserEntity {
  UserAvatarEntity userAvatar;
  String nickname;
  int id;

  UserEntity({
    required this.userAvatar,
    required this.nickname,
    required this.id,
  });
}

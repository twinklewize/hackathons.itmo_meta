import 'package:ict_hack/entities/enventory_item.dart';
import 'package:ict_hack/entities/user_avatar_entity.dart';

class UserEntity {
  int id;
  UserAvatarEntity userAvatar;
  String nickname;
  List<EnventoryItem> inventoryItems;
  List<int> achievments;

  UserEntity({
    required this.userAvatar,
    required this.nickname,
    required this.id,
    required this.inventoryItems,
    required this.achievments,
  });
}

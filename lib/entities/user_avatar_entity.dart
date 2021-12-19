class UserAvatarEntity {
  int backgroundColorId;
  int bodyId;
  int browsId;
  int eyesId;
  int hairstyleId;
  int mouthId;

  int pantsId;
  int tShirtId;
  int bootsId;

  int glassesId;

  UserAvatarEntity({
    required this.backgroundColorId,
    required this.bodyId,
    required this.browsId,
    required this.eyesId,
    required this.hairstyleId,
    required this.mouthId,
    this.pantsId = 0,
    this.tShirtId = 0,
    this.bootsId = 0,
    this.glassesId = -1,
  });
}

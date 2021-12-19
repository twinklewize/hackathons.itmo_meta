import 'package:ict_hack/entities/achievment_entity.dart';

class AchievmentInformation {
  AchievmentInformation._();

  static List<AchievmentEntity> achievments = [
    AchievmentEntity(
      id: 0,
      title: 'Первый запуск',
      imageUrl: 'assets/achievments/achievement_1.png',
      text: 'Собери аватар своего персонажа в метавселенной ИТМО',
    ),
    AchievmentEntity(
      id: 1,
      title: 'Современные технологии',
      imageUrl: 'assets/achievments/achievement_2.png',
      text: 'Соверши покупку в маркетплейсе ИТМО',
    ),
    AchievmentEntity(
      id: 2,
      title: 'Bubble Hoop',
      imageUrl: 'assets/achievments/achievement_3.png',
      text: 'Собери все вещи из игрового магазина',
    ),
    AchievmentEntity(
      id: 3,
      title: 'Мясорубка',
      imageUrl: 'assets/achievments/achievement_4.png',
      text: 'Займи первое место в топе всех жителей метавселенной',
    ),
    AchievmentEntity(
      id: 4,
      title: 'Дальтонизм',
      imageUrl: 'assets/achievments/achievement_5.png',
      text: 'Выучись на дизайнера будучи дальтоником',
    ),
  ];
}

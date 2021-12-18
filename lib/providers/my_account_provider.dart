import 'package:flutter/material.dart';
import 'package:ict_hack/entities/post.dart';

class MyAccountProvider with ChangeNotifier {
  List<Post> posts = [
    Post(
      id: '1',
      authorId: '1',
      title: 'Заголовок 1',
      dateTime: DateTime.now(),
      imageUrl: 'https://pbs.twimg.com/media/FBl97R-XsAInRmr.jpg',
      text: 'Hello poeple who love gay boundage website!',
      howManyComments: 0,
      userWhoLikedIds: [],
    ),
    Post(
      id: '2',
      authorId: '1',
      title: 'Заголовок 2',
      dateTime: DateTime.now(),
      text:
          'Любимый, желаю тебе в 2022 году, чтобы у тебя была большая красивая ёлка и много-много маленьких ёлочек',
      howManyComments: 0,
      userWhoLikedIds: [],
    ),
    Post(
      id: '3',
      authorId: '1',
      title: 'Бипки',
      dateTime: DateTime.now(),
      text:
          'Ловушка цукерберга Ловушки и капканы. Как вы уже поняли, мы ведем речь о ловушке цукербента. Это слово я впервые услышал в фильме «Матрица». Там его произносит Морфеус, объясняя Нео устройство мира, в котором он живет. Так вот, Морфеус говорит, что для того, чтобы попасть в матрицу, нужно всего лишь щелкнуть выключателем. А вот чтобы выбраться из нее, нужно щелкнуть по выключателю еще раз. Мы, все, кто живет в матрице, не знаем, есть ли еще кнопка, позволяющая щелкнуть снова.',
      howManyComments: 0,
      userWhoLikedIds: [],
    ),
  ];

  void addNewPost(Post newPost) {
    posts.add(newPost);
    notifyListeners();
  }

  void changeUsername(String newUsername) {
    notifyListeners();
  }

  void exitFromAccount() {
    notifyListeners();
  }

  // TODO заменить myId на реальный id текущего юзера
  void likeSpecificPost(String postId) {
    for (var post in posts) {
      if (post.id == postId) {
        if (post.userWhoLikedIds.contains('myId')) {
          post.userWhoLikedIds.removeWhere((id) => id == 'myId');
        } else {
          post.userWhoLikedIds.add("myId");
        }
      }
    }
    notifyListeners();
  }
}

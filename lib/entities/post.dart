class Post {
  String id;
  String authorId;
  DateTime dateTime;
  String text;
  String title;
  String? imageUrl;
  int howManyComments;
  List<String> userWhoLikedIds;

  Post({
    required this.id,
    required this.authorId,
    required this.dateTime,
    required this.text,
    required this.title,
    this.imageUrl,
    required this.howManyComments,
    required this.userWhoLikedIds,
  });
}

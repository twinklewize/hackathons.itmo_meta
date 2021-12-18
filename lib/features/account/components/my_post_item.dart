import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ict_hack/entities/post.dart';
import 'package:ict_hack/providers/my_account_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyPostItem extends StatelessWidget {
  MyPostItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  Post post;

  Widget informationCard(
    String assetName,
    String count,
    Function() onButton,
    bool uLikedOrNot,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: uLikedOrNot ? Colors.red.withOpacity(0.1) : Colors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onButton(),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ),
            height: 32,
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(
                    assetName,
                    color: uLikedOrNot ? Colors.red : Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  count,
                  style: TextStyle(
                    color: uLikedOrNot ? Colors.red : Colors.black,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Container(
          margin: const EdgeInsets.all(12),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // avatar preview, username
              Row(
                children: [
                  // avatar preview
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 42.0,
                            height: 42.0,
                            child: CircleAvatar(),
                          ),
                          // draw a green badge
                          Positioned(
                            bottom: 0.0,
                            right: 0.0,
                            child: Stack(
                              children: [
                                Icon(
                                  Icons.brightness_1,
                                  size: 12.0,
                                  color: Colors.white,
                                ),

                                // TODO добавить проверку на онлайн пользователя
                                Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  left: 0.0,
                                  top: 0.0,
                                  child: Icon(
                                    Icons.brightness_1,
                                    size: 8.0,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),

                  // username, city & date
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // username
                        Text(
                          post.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        // date
                        Text(
                          DateFormat("dd.MM.yyyy").format(post.dateTime),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // more_icon
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.more_vert_rounded,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // текст объявления
              Text(
                post.text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),

              post.imageUrl != null
                  ? const SizedBox(height: 12)
                  : const SizedBox(),

              post.imageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://pbs.twimg.com/media/FBl97R-XsAInRmr.jpg',
                        width: MediaQuery.of(context).size.width - 48,
                        height: MediaQuery.of(context).size.width - 48,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox(),

              const SizedBox(height: 12),

              Row(
                children: [
                  informationCard(
                    'assets/icons/like.png',
                    post.userWhoLikedIds.length.toString(),
                    () {
                      Provider.of<MyAccountProvider>(context, listen: false)
                          .likeSpecificPost(post.id);
                    },
                    post.userWhoLikedIds.contains('myId'),
                  ),
                  const SizedBox(width: 8),
                  informationCard('assets/icons/comment.png',
                      post.howManyComments.toString(), () {}, false),
                  const SizedBox(width: 8),
                  informationCard('assets/icons/share.png',
                      post.howManyComments.toString(), () {}, false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

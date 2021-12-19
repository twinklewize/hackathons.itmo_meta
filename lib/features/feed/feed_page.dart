import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/feed_provider.dart';
import '../../ui_kit/constants/app_colors.dart';
import 'components/post_details_page.dart';
import 'components/post_item.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: const Text('Лента'),
      backgroundColor: AppColors.primary,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add_outlined),
        ),
      ],
    );
    var posts = Provider.of<FeedProvider>(context).posts;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            for (var post in posts)
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          PostDetailsPage(post: post),
                    ),
                  );
                },
                child: PostItem(post: post),
              ),
          ],
        ),
      ),
    );
  }
}

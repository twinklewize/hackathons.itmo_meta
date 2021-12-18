import 'package:flutter/material.dart';
import 'package:ict_hack/features/feed/components/post_item.dart';
import 'package:ict_hack/providers/feed_provider.dart';
import 'package:provider/provider.dart';

import 'components/post_details_page.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: const Text('Лента'),
    );
    var posts = Provider.of<FeedProvider>(context).posts;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
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

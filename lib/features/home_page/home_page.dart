import 'package:flutter/material.dart';
import 'package:ict_hack/features/account/my_account_page.dart';
import 'package:ict_hack/features/chats/chats_page.dart';
import 'package:ict_hack/features/feed/feed_page.dart';
import 'package:ict_hack/features/market/market_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentPage = MarketPage();
    switch (index) {
      case 0:
        currentPage = FeedPage();
        break;
      case 1:
        currentPage = MarketPage();

        break;
      case 2:
        currentPage = ChatsPage();
        break;
      case 3:
        currentPage = MyAccountPage();
        break;
    }
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.rss_feed,
              color: index == 0 ? Colors.blue : Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: index == 1 ? Colors.blue : Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: index == 2 ? Colors.blue : Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: index == 3 ? Colors.blue : Colors.grey,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}

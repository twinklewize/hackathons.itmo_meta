import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ict_hack/features/account/my_account_page.dart';
import 'package:ict_hack/features/chats/chats_page.dart';
import 'package:ict_hack/features/feed/feed_page.dart';
import 'package:ict_hack/features/market/market_page.dart';
import 'package:ict_hack/ui_kit/constants/app_colors.dart';

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
        elevation: 0,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/rss.svg',
              color: index == 0 ? AppColors.blue : Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/shopping-cart.svg',
              color: index == 1 ? AppColors.blue : Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/message-square.svg',
              color: index == 2 ? AppColors.blue : Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              color: index == 3 ? AppColors.blue : Colors.grey,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}

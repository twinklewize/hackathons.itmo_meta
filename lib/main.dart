import 'package:flutter/material.dart';
import 'custom_avatar/custom_avatar_view_model.dart';
import 'package:provider/provider.dart';
import 'custom_avatar/custom_avatar_view.dart';
import 'providers/market_provider.dart';
import 'providers/my_account_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MarketProvider(),
        ),
        ChangeNotifierProvider.value(
          value: MyAccountProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CustomAvatarViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'ITMO Meta',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CustomAvatarView(),
      ),
    );
  }
}

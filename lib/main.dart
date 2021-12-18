import 'package:flutter/material.dart';
import 'package:ict_hack/features/account/my_account_page.dart';
import 'package:ict_hack/providers/my_account_provider.dart';
import 'package:ict_hack/features/home_page/home_page.dart';
import 'package:ict_hack/providers/market_provider.dart';
import 'package:provider/provider.dart';

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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

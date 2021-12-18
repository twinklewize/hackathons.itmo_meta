import 'package:flutter/material.dart';
import 'package:itmo_meta/custom_avatar/custom_avatar_view_model.dart';
import 'package:itmo_meta/ui_kit/constants/app_colors.dart';
import 'package:provider/provider.dart';

import 'custom_avatar/custom_avatar_view.dart';

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
          value: CustomAvatarViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ITMO Meta',
        theme: ThemeData(
          primaryColor: AppColors.primary,
        ),
        home: CustomAvatarView(),
      ),
    );
  }
}

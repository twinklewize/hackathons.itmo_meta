import 'package:flutter/material.dart';
import '../../ui_kit/constants/app_colors.dart';
import '../../ui_kit/half_long_button.dart';
import 'login_page.dart';
import 'register_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(height: 19),
            const Spacer(),
            Image.asset('assets/images/logo.png'),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              margin: const EdgeInsets.symmetric(horizontal: 64),
              child: const Text(
                'Общайтесь со своими друзьями в метавселенной ИТМО',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(
                onTap: () {
                  print("Sign up with ISU");
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => RegisterPage(),
                    ),
                  );
                },
                child: HalfLongButton(
                  fillColor: AppColors.primary,
                  titleTextColor: Colors.black,
                  title: 'Регистрация',
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Center(
              child: Text(
                'or',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(
                onTap: () {
                  print("Login with ISU");
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => LoginPage(),
                    ),
                  );
                },
                child: HalfLongButton(
                  fillColor: AppColors.primary,
                  titleTextColor: Colors.black,
                  title: 'Вход',
                ),
              ),
            ),
            const SizedBox(height: 56),
          ],
        ),
      ),
    );
  }
}

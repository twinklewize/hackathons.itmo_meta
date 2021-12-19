import 'package:flutter/material.dart';
import 'package:ict_hack/ui_kit/half_long_button.dart';
import '../../ui_kit/constants/app_colors.dart';
import '../../ui_kit/widgets/textfield.dart';

class RegisterPage extends StatelessWidget {
  // controllers
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Регистрация'),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        color: AppColors.backgroundLight,
        child: SafeArea(
          child: Container(
            color: AppColors.backgroundLight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  const SizedBox(height: 32),

                  // Form
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // email title
                        const Text(
                          'ИСУ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // email field
                        MyTextField(
                          onChanged: (value) => print(value),
                          controller: emailEditingController,
                          fillColor: Colors.white,
                          labelText: 'Номер ИСУ',
                          maxLines: 1,
                          minLines: 1,
                          keyboardType: TextInputType.emailAddress,
                          inputTextColor: Colors.black,
                          textInputAction: TextInputAction.continueAction,
                        ),

                        const SizedBox(height: 32),

                        // password title
                        const Text(
                          'Пароль',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // password field
                        MyTextField(
                          onChanged: (value) => print(value),
                          controller: passwordEditingController,
                          fillColor: Colors.white,
                          labelText: 'Пароль',
                          maxLines: 1,
                          minLines: 1,
                          keyboardType: TextInputType.emailAddress,
                          inputTextColor: Colors.black,
                          textInputAction: TextInputAction.continueAction,
                        ),

                        const SizedBox(height: 48),
                      ],
                    ),
                  ),

                  // кнопка sign up
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        //
                      },
                      child: HalfLongButton(
                        title: "Регистрация",
                        fillColor: AppColors.primary,
                        titleTextColor: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

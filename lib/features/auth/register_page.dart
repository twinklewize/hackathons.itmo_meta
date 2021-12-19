import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ict_hack/features/custom_avatar/custom_avatar_view.dart';
import 'package:ict_hack/ui_kit/half_long_button.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
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
                          keyboardType: TextInputType.number,
                          inputTextColor: Colors.black,
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
                        ),

                        const SizedBox(height: 48),
                      ],
                    ),
                  ),

                  // кнопка sign up
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () async {
                        int responseCode = await Provider.of<AuthProvider>(
                                context,
                                listen: false)
                            .register(
                          int.parse(emailEditingController.text),
                          passwordEditingController.text,
                          context,
                        );
                        print(responseCode);
                        if (responseCode == 200) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  CustomAvatarView(newAvatar: true),
                            ),
                          );
                        } else {
                          Fluttertoast.showToast(
                              msg: "Register Error",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
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

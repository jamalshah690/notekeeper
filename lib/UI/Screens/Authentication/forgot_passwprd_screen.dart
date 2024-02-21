import 'package:flutter/material.dart';
import 'package:notekeeper/UI/Screens/Authentication/login_screen.dart';
import 'package:notekeeper/UI/custom_widgets/background_images.dart';
import 'package:notekeeper/UI/custom_widgets/custom_buttons.dart';
import 'package:get/get.dart';
import 'package:notekeeper/UI/custom_widgets/custom_textfield.dart';

import '../../../Core/Constants/colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 130),
              const Center(
                child: Text(
                  'Forgot Password!',
                  style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w700, color: kBlack),
                ),
              ),
              const SizedBox(height: 5.0),
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    'Just put your email and check inbox',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, color: kBlack),
                  ),
                ),
              ),
              const SizedBox(height: 56),
              CustomTextField(
                prefixIcon: const Icon(
                  Icons.alternate_email,
                  color: kPrimaryColor,
                ),
                controller: emailController,
                hintText: 'Email',
              ),
              const SizedBox(height: 20.0),
              MyButtonLong(
                  name: 'Reset',
                  onTap: () {
                    Get.to(() => const LoginScreen());
                  }),
              const SizedBox(height: 30.0),
              Center(
                child: MyTextButton(
                    name: 'Back To Login',
                    onTap: () {
                      Get.to(() => const LoginScreen());
                    }),
              ),
              const SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}

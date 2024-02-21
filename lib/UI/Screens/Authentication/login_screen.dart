import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:notekeeper/UI/Screens/Task%20screeens/tasks_screen.dart';
import 'package:notekeeper/UI/custom_widgets/background_images.dart';
import 'package:notekeeper/UI/custom_widgets/custom_buttons.dart';
import 'package:notekeeper/UI/custom_widgets/custom_snackbars.dart';
import 'package:notekeeper/UI/custom_widgets/custom_textfield.dart';

import '../../../Core/Constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 220),
                const Center(
                  child: Text(
                    'Hello Again!',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: kBlack),
                  ),
                ),
                const SizedBox(height: 5.0),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      'Welcome back you have\n been missed',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, color: kBlack),
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                MyButtonLong(
                    name: 'Continue with Guest ',
                    onTap: () {
                      Get.offAll(() => const TasksScreen());
                    }),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

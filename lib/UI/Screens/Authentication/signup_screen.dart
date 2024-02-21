import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notekeeper/Core/Controllers/auth_controller.dart';
import 'package:notekeeper/UI/Screens/Authentication/login_screen.dart';
import 'package:notekeeper/UI/Screens/Task%20screeens/tasks_screen.dart';
import 'package:notekeeper/UI/custom_widgets/background_images.dart';
import 'package:notekeeper/UI/custom_widgets/custom_buttons.dart';
import 'package:notekeeper/UI/custom_widgets/custom_snackbars.dart';
import 'package:notekeeper/UI/custom_widgets/custom_textfield.dart';

import '../../../Core/Constants/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController conPassController = TextEditingController();
  final auth = Get.find<AuthController>();
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
                const SizedBox(height: 50),
                const Center(
                  child: Text(
                    'Registration',
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
                      'Please register yourself\n to continue',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, color: kBlack),
                    ),
                  ),
                ),
                const SizedBox(height: 56),
                CustomTextField(
                  prefixIcon: const Icon(
                    Icons.person,
                    color: kPrimaryColor,
                  ),
                  controller: nameController,
                  hintText: 'Name',
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  prefixIcon: const Icon(
                    Icons.alternate_email,
                    color: kPrimaryColor,
                  ),
                  controller: emailController,
                  hintText: 'Email',
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  prefixIcon: const Icon(
                    Icons.lock_open,
                    color: kPrimaryColor,
                  ),
                  controller: passController,
                  obscure: auth.isPasswordVisible,
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      auth.togglePasswordVisibility();
                    },
                    icon: Icon(
                      auth.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  prefixIcon: const Icon(
                    Icons.lock_open,
                    color: kPrimaryColor,
                  ),
                  controller: conPassController,
                  obscure: auth.isPasswordVisible,
                  hintText: 'Confirm Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      auth.togglePasswordVisibility();
                    },
                    icon: Icon(
                      auth.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                MyButtonLong(
                    name: 'Sign Up',
                    onTap: () {
                      if (emailController.text.isEmpty ||
                          nameController.text.isEmpty ||
                          passController.text.isEmpty) {
                        return CustomSnackBar.showError(
                            'Please fill all the fields');
                      } else {
                        Get.offAll(() => const TasksScreen());
                      }
                    }),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Already Register?",
                      style: TextStyle(
                          fontSize: 15.0, color: kBlack.withOpacity(0.4)),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => const LoginScreen());
                        },
                        child: const Text(
                          'Login Now',
                          style: TextStyle(color: kBlack),
                        ))
                  ],
                ),
                const SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

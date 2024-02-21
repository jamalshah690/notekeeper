import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:notekeeper/Core/Constants/colors.dart';
import 'package:notekeeper/Core/Constants/strings.dart';
import 'package:notekeeper/Core/Controllers/task_controller.dart';
import 'package:notekeeper/UI/Screens/Authentication/login_screen.dart';
import 'package:notekeeper/UI/Screens/Task%20screeens/tasks_screen.dart';
import 'package:notekeeper/UI/Screens/introduction_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

int? initScreen;
SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  prefs = await SharedPreferences.getInstance();
  initScreen = (prefs?.getInt("initScreen"));
  prefs?.setInt("initScreen", 1);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TaskController());

    return GetMaterialApp(
      title: 'ToDo app',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'MyFont',
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              centerTitle: true, foregroundColor: kWhite, toolbarHeight: 70),
          scaffoldBackgroundColor: kBGColor),
      initialRoute: initScreen == 0 || initScreen == null ? "/" : "home",
      routes: {
        '/': (context) => const MyIntroductionScreen(),
        'home': (context) => const TasksScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

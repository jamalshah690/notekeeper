import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notekeeper/Core/Constants/colors.dart';
import 'package:notekeeper/Core/Constants/images_urls.dart';
import 'package:notekeeper/Core/Constants/styles.dart';
import 'package:notekeeper/Core/Controllers/task_controller.dart';
import 'package:notekeeper/UI/custom_widgets/custom_buttons.dart';
import 'package:notekeeper/UI/custom_widgets/custom_snackbars.dart';
import 'package:notekeeper/UI/custom_widgets/custom_textfield.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();

  final taskController = Get.find<TaskController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kPrimaryColor),
        title: const Text(
          'Adding  Task Screen',
          style: kHead1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  ImagesUrls.addImage,
                  height: 200,
                ),
              ),
              CustomTextField(
                prefixIcon: const Icon(
                  Icons.title,
                  color: kPrimaryColor,
                ),
                controller: titleController,
                hintText: 'Title',
              ),
              const SizedBox(height: 10.0),
              const SizedBox(height: 10.0),
              MyButtonLong(
                  name: 'Add Task',
                  onTap: () {
                    if (titleController.text.isEmpty) {
                      return CustomSnackBar.showError('Please provide title');
                    } else {
                      taskController.addTask(
                          title: titleController.text.toString());
                      taskController.fetchTasks();
                      titleController.clear();
                      Get.back();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:notekeeper/Core/Controllers/task_controller.dart';

class CustomDialog {
  static Future<bool?> showDeleteConfirmationDialog(
      BuildContext context, String id) async {
    return await Get.dialog<bool>(
      AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Get.back(result: false);
            },
          ),
          TextButton(
            child: const Text('Delete'),
            onPressed: () {
              final taskController = Get.find<TaskController>();
              id.toString();
              taskController.removeTask(id.toString());
              taskController.fetchTasks();
              Get.back(result: true);
            },
          ),
        ],
      ),
    );
  }
}

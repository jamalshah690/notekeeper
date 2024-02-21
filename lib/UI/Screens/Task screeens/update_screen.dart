// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:notekeeper/Core/Controllers/task_controller.dart';
import 'package:notekeeper/Core/Models/task_model.dart';
import 'package:notekeeper/UI/custom_widgets/custom_buttons.dart';

class TitleUpdateDialog extends StatefulWidget {
  Task task;
  TitleUpdateDialog({
    Key? key,
    required this.task,
  }) : super(key: key);
  @override
  _TitleUpdateDialogState createState() => _TitleUpdateDialogState();
}

class _TitleUpdateDialogState extends State<TitleUpdateDialog> {
  TextEditingController _titleController = TextEditingController();
  final updateTasks = Get.find<TaskController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController.text = widget.task.name;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Update Progress'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'New Title'),
          ),
        ],
      ),
      actions: <Widget>[
        MyButton(
          name: 'Cancel',
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        MyButton(
          name: 'Update',
          onTap: () {
            updateTasks.updateTask(
                title: _titleController.text.toString(),
                taskId: widget.task.id.toString());
            updateTasks.fetchTasks();

            Get.back();
          },
        ),
      ],
    );
  }
}

 

// Example usage:
// Call showTitleUpdateDialog(context); where you want to show the dialog

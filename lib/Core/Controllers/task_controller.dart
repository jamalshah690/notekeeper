import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:notekeeper/Core/Models/task_model.dart';
import 'package:notekeeper/Core/enums/task_sorting.dart';

class TaskController extends GetxController {
  Rx<List<Task>> tasks = Rx<List<Task>>([]);

  RxString errorHomeText = ''.obs;

  RxBool isLoading = false.obs;
  Rx<AppStatus> appStatusHome = AppStatus.LOADING.obs;
  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  void setAppStatusHome(AppStatus _value) => appStatusHome.value = _value;
  void setErrorHome(String _errorValue) => errorHomeText.value = _errorValue;

  Future<void> fetchTasks() async {
    setAppStatusHome(AppStatus.LOADING);
    try {
      var data = await FirebaseFirestore.instance.collection('tasks').get();
      List<Task> taskList =
          data!.docs.map((doc) => Task.fromJson(doc.data())).toList();
      tasks.value = taskList;
      setAppStatusHome(AppStatus.COMPLETED);
    } catch (e) {
      setAppStatusHome(AppStatus.ERROR);
      setErrorHome(e.toString());
    }
  }

  Future<void> addTask({required String title}) async {
    String id = Random().nextInt(100).toString();
    await FirebaseFirestore.instance.collection('tasks').doc(id).set({
      'taskId': id,
      'taskTitle': title,
    });
  }

  Future<void> updateTask(
      {required String taskId, required String title}) async {
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(taskId)
        .update({'taskTitle': title});
  }

  Future<void> removeTask(String taskId) async {
    await FirebaseFirestore.instance.collection('tasks').doc(taskId).delete();
  }
}

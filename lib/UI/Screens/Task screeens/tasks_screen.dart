import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:notekeeper/Core/Constants/colors.dart';
import 'package:notekeeper/Core/Constants/images_urls.dart';
import 'package:notekeeper/Core/Constants/styles.dart';

import 'package:notekeeper/Core/Controllers/task_controller.dart';
import 'package:notekeeper/Core/Models/task_model.dart';
import 'package:notekeeper/Core/enums/task_sorting.dart';
import 'package:notekeeper/UI/Screens/Task%20screeens/add_task_screen.dart';
import 'package:notekeeper/UI/Screens/Task%20screeens/update_screen.dart';
import 'package:notekeeper/UI/custom_widgets/background_images.dart';
import 'package:notekeeper/UI/custom_widgets/delete_dialog.dart';
import 'package:lottie/lottie.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final taskController = Get.find<TaskController>();
  @override
  void initState() {
    taskController.fetchTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Todo Progress',
            style: kHead1,
          ),
          toolbarHeight: 50,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: GetX<TaskController>(
            init: TaskController(),
            builder: (TaskController taskController) {
              return taskController.appStatusHome.value == AppStatus.LOADING
                  ? Center(
                      child: LottieBuilder.asset(
                        ImagesUrls.loading,
                        width: 80,
                        height: 80,
                      ),
                    )
                  : taskController.appStatusHome.value == AppStatus.COMPLETED
                      ? taskController.tasks.value.isEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Add a new progress',
                                      style: kHead1.copyWith(
                                          fontSize: 17, color: kSecondaryColor),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => const AddTaskScreen());
                                      },
                                      child: const Icon(
                                        Icons.add,
                                        color: kPrimaryColor,
                                        size: 26,
                                      ),
                                    )
                                  ],
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 150),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(23.0)
                                              .copyWith(bottom: 0),
                                          child: LottieBuilder.asset(
                                            ImagesUrls.notFound,
                                            width: 150,
                                            height: 150,
                                          ),
                                        ),
                                        const Text(
                                          'List is Empty',
                                          style: kHead1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Add a new progress',
                                      style: kHead1.copyWith(
                                          fontSize: 17, color: kSecondaryColor),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => const AddTaskScreen());
                                      },
                                      child: const Icon(
                                        Icons.add,
                                        color: kPrimaryColor,
                                        size: 26,
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: AnimationLimiter(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          taskController.tasks.value.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        Task task =
                                            taskController.tasks.value[index];
                                        return AnimationConfiguration
                                            .staggeredList(
                                          position: index,
                                          duration:
                                              const Duration(milliseconds: 400),
                                          child: SlideAnimation(
                                            verticalOffset: 44.0,
                                            child: FadeInAnimation(
                                              child: ListTile(
                                                subtitle: const Text(
                                                  'tap when you wanna update',
                                                  style: TextStyle(
                                                      fontSize: 8,
                                                      color: Colors.grey),
                                                ),
                                                contentPadding: EdgeInsets.zero,
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return TitleUpdateDialog(
                                                        task: task,
                                                      );
                                                    },
                                                  );
                                                },
                                                title: Text(
                                                    task.name.toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black)),
                                                trailing: InkWell(
                                                  onTap: () {
                                                    CustomDialog
                                                        .showDeleteConfirmationDialog(
                                                            context,
                                                            task.id.toString());
                                                  },
                                                  child: const Icon(
                                                    Icons.delete,
                                                    color: kPrimaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )
                      : Center(
                          child: Column(
                            children: [
                              Lottie.asset(
                                ImagesUrls.errorImage,
                                width: 150,
                                height: 150,
                              ),
                              Text(taskController.errorHomeText.value
                                  .toString()),
                            ],
                          ),
                        );
            },
          ),
        ),
      ),
    );
  }
}

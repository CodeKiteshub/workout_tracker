import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_tracker/common/bottom_bar.dart';
import 'package:workout_tracker/features/home/cotroller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      appBar: AppBar(
        title: const Text("Workouts"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (homeController.recommendations.isEmpty) {
          return const Text("No recommendations available");
        }

        return ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          itemCount: homeController.recommendations.length,
          itemBuilder: (context, index) {
            final recommendation = homeController.recommendations[index];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                title: Text(recommendation.name),
                subtitle: const Text("15 minutes | Beginner"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  final selectedWorkout = homeController.recommendations[index];
                  TextEditingController valueController =
                      TextEditingController();
                  // Navigate to a workout details page or handle workout marking as done
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: const Text("Please give rating."),
                            actions: [
                              TextField(
                                  controller: valueController,
                                  keyboardType:
                                      const TextInputType.numberWithOptions()),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text("Cancel")),
                                  TextButton(
                                      onPressed: () async {
                                        if (valueController.text.isNotEmpty) {
                                         await homeController.markWorkoutDone(
                                              selectedWorkout,
                                              int.parse(
                                                  valueController.text.trim()));
                                          Get.back();
                                          Get.snackbar("Success",
                                              "Your Workout is done");
                                        }
                                      },
                                      child: const Text("Done")),
                                ],
                              )
                            ],
                          ));
                },
              ),
            );
          },
        );
      }),
    );
  }
}

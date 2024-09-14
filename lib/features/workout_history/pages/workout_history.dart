import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_tracker/features/workout_history/controller/workout_history_controller.dart';

class WorkoutHistory extends StatelessWidget {
  WorkoutHistory({super.key});

  WorkoutHistoryController workoutHistoryController =
      Get.put(WorkoutHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workout History"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (workoutHistoryController.workouts.isEmpty) {
          return const Text("No workouts available");
        }

        return ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          itemCount: workoutHistoryController.workouts.length,
          itemBuilder: (context, index) {
            final recommendation = workoutHistoryController.workouts[index];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                title: Text(recommendation.name),
                trailing: Text("Value ${recommendation.value}"),
              ),
            );
          },
        );
      }),
    );
  }
}

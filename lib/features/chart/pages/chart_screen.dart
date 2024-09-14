import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_tracker/features/workout_history/controller/workout_history_controller.dart';

class ChartScreen extends StatelessWidget {
  ChartScreen({super.key});

  WorkoutHistoryController workoutHistoryController =
      Get.put(WorkoutHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chart"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 3 / 4,
          child: Obx(() {
            return workoutHistoryController.workouts.isEmpty
                ? const Text("No workouts available")
                : BarChart(
                    BarChartData(
                        barGroups: List.generate(
                      workoutHistoryController.workouts.length,
                      (index) => BarChartGroupData(
                        x: index + 1,
                        barRods: [
                          BarChartRodData(
                              toY: workoutHistoryController
                                  .workouts[index].value
                                  .toDouble(),
                              width: 15,
                              color: Colors.blue[200],
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10))),
                        ],
                      ),
                    )),

                    swapAnimationDuration:
                        const Duration(milliseconds: 150), // Optional
                    swapAnimationCurve: Curves.linear, // Optional
                  );
          }),
        ),
      ),
    );
  }
}

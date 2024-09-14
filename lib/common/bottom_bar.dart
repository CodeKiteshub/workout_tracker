import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_tracker/features/chart/pages/chart_screen.dart';
import 'package:workout_tracker/features/home/pages/home_screen.dart';
import 'package:workout_tracker/features/workout_history/pages/workout_history.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (value) {
          if (value == 0) {
            Get.to(() =>  HomeScreen());
          }
          if (value == 1) {
            Get.to(() =>  WorkoutHistory());
          }
          if (value == 2) {
            Get.to(() =>  ChartScreen());
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: "Workout History"),
          BottomNavigationBarItem(icon: Icon(Icons.auto_graph), label: "Chart"),
        ]);
  }
}

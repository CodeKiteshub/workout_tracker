import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:workout_tracker/data/models/workout/workout.dart';

class HomeController extends GetxController {
  var workouts = <Workout>[].obs; // List of today's workouts

  var recommendations = <Workout>[].obs; // Recommended workouts

  @override
  void onInit() {
    super.onInit();

    _loadRecommendations();
  }

  // Filter by All workouts
  void filterByAll() {
    var box = Hive.box('workoutBox');
    workouts.value = box.values.cast<Workout>().toList();
  }

  // Filter by a specific date
  void filterByDate(DateTime selectedDate) {
    var box = Hive.box('workoutBox');
    workouts.value = box.values
        .where((workout) =>
            workout is Workout &&
            workout.date!.day == selectedDate.day &&
            workout.date!.month == selectedDate.month &&
            workout.date!.year == selectedDate.year)
        .cast<Workout>()
        .toList();
  }

  // Load recommendations
  void _loadRecommendations() {
    recommendations.value = [
      Workout(name: "Pull Up", value: 0),
      Workout(name: "Sit Up", value: 0),
      Workout(name: "Bicep Curl", value: 0),
    ];
  }

  // Mark a workout as done
  Future<void> markWorkoutDone(Workout workout, int value) async {
    workout.value = value;
    workout.date = DateTime.now();
    Box<Workout> box = await Hive.openBox<Workout>(
        'workoutBox'); // Use <Workout> to specify the type
    box.add(workout); // Save updated workout as a Workout object
    log(box.length.toString());
    box.close();
  }
}

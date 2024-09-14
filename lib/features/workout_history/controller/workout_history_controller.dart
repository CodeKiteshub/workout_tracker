import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:workout_tracker/data/models/workout/workout.dart';

class WorkoutHistoryController extends GetxController {
  RxList<Workout> workouts = <Workout>[].obs;

  @override
  void onInit() {
    loadSavedWorkouts();
    super.onInit();
  }

  loadSavedWorkouts() async {
    Box<Workout> box =
        await Hive.openBox('workoutBox'); // Use <Workout> to specify the type
    workouts.value = box.values.toList();
  }
}

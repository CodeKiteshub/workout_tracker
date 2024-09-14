import 'package:hive/hive.dart';

part 'workout.g.dart'; // Run the command to generate this adapter

@HiveType(typeId: 1)
class Workout extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  DateTime? date;

  @HiveField(2)
  int value;

  Workout({required this.name,  this.date, required this.value});
}

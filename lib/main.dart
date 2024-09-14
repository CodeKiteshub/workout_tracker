import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:workout_tracker/data/models/workout/workout.dart';
import 'package:workout_tracker/features/home/pages/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  
  // Register adapters if you have any Hive type adapters
  // Hive.registerAdapter(UserProfileAdapter());


  Hive.registerAdapter(WorkoutAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomeScreen(),
    );
  }
}
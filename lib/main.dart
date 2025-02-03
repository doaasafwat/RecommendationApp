import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recommendation_app/firebase_options.dart';
import 'package:recommendation_app/views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const RecommendationApp());
}

class RecommendationApp extends StatelessWidget {
  const RecommendationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

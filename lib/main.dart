import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:posts_app/pages/home_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  return runApp(
    MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
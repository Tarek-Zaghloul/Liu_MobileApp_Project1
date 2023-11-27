import 'package:flutter/material.dart';
import 'package:project1/login.dart';
import 'dart:async';
import 'home_page.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'Train Tickets',
      home: Login(),
    );
  }
}

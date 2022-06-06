import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pos_hall/config/badCertificateHandler.dart';

import 'final_hall.dart';
void main() {
  runApp(const MyApp());
  HttpOverrides.global = DevHttpOverrides();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FHall());
  }
}

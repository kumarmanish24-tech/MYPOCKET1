import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import 'ui/home.dart';

import 'ui/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();



  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.blue, // Status bar background color (Android only)
    statusBarIconBrightness: Brightness.light, // White status bar icons (Android)
    statusBarBrightness: Brightness.dark, // White status bar icons (iOS)
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(


        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FloatingNavBarScreen(),
    );
  }
}


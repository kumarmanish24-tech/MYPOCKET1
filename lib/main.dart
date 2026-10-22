import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:mypocket/state_provider/provider_for_addmoney_page.dart';
import 'package:provider/provider.dart';

import 'ui/home.dart';

import 'ui/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();



  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.blue, // Status bar background color (Android only)
    statusBarIconBrightness: Brightness.light, // White status bar icons (Android)
    statusBarBrightness: Brightness.dark, // White status bar icons (iOS)
  ));
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => Addmoney()),
      ChangeNotifierProvider(create: (_) => TimeModel()),
      ChangeNotifierProvider(create: (_) => Receivedmoneyfrommethod()),
      ChangeNotifierProvider(create: (_) => ReceivedmoneyViamethod()),

    ],
    child: const MyApp(),)
  );
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
          scaffoldBackgroundColor: Colors.black, // Fixes page transition background
          canvasColor: Colors.black,             // Prevents route canvas flashing
          colorScheme: const ColorScheme.dark(),  // Sets default dark palette



      ),
      home: FloatingNavBarScreen(),
    );
  }
}


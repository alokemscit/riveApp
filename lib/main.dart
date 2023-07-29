import 'package:abc/constants.dart';
import 'package:abc/menu/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'entrypoint/entry_point.dart';
import 'home/home_screen.dart';
import 'onboding/onboding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black,
        statusBarBrightness: Brightness.dark));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      theme: ThemeData(
          backgroundColor:backgroundColor2,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: EntryPoint(), //OnbodingScreen(),
    );
  }
}
 
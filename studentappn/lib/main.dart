import 'package:flutter/material.dart';
import 'package:studentappn/myhome_page.dart';
import 'package:get/get.dart';
import 'package:studentappn/signin.dart';
import 'package:studentappn/signup.dart';
import 'controller/init_controller.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentappn/slidebar_menu.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
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
        primarySwatch: Colors.blue,
      ),
      // home: Signin(),
      home: (Signin()),
    );
  }
}

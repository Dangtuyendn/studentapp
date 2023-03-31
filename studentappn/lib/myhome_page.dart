import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentappn/infomation_input.dart';
import 'package:studentappn/signin.dart';
import 'package:studentappn/view.dart';
import 'package:studentappn/widget/background.dart';
import 'package:studentappn/widget/studen/student_tab.dart';
import 'controller/list_controller.dart';
import 'package:studentappn/widget/button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentappn/widget/tab_widget.dart';
import 'package:studentappn/widget/studen/student_tab.dart';

class MyHomePage extends StatelessWidget {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ListController controller = Get.find();
    return Scaffold(
      
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () async {
                final SharedPreferences? prefs = await _prefs;
                prefs?.clear();
                Get.offAll(Signin());
              },
              child: Row(
                children: const [
                  Text(
                    'Logout',
                    style: TextStyle(fontSize: 23, color: Colors.white),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(
                    Icons.output,
                    color: Colors.white,
                  )
                ],
              ))
        ],
      ),
      body: Stack(
        children: [
          //background
          const BackGround(Image: 'assets/images/home.jpg'),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                //row1
                Row(children: [
                  TabWidget(
                    backgroundColor: Colors.yellow,
                    textColor: Colors.white,
                    title: 'Student',
                    textsize: 23,
                    onPressed: () => Get.to(StudentTab()),
                  ),
                  TabWidget(
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    title: 'Teacher',
                    textsize: 23,
                    onPressed: () => Get.to(StudentTab()),
                  ),
                  
                ]),
                Row(
                  children: [
                    TabWidget(
                      backgroundColor: Colors.lightBlue,
                      textColor: Colors.white,
                      title: 'SubJect',
                      textsize: 23,
                      onPressed: () => Get.to(StudentTab()),
                    ),
                    TabWidget(
                      backgroundColor: Colors.brown,
                      textColor: Colors.white,
                      title: 'ClassRoom',
                      textsize: 23,
                      onPressed: () => Get.to(StudentTab()),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

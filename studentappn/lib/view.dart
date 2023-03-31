import 'package:studentappn/controller/list_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:studentappn/detail_infomation.dart';
import 'package:studentappn/student.dart';
import 'package:studentappn/widget/button.dart';
import 'package:studentappn/edit_infomation.dart';
import 'package:studentappn/widget/studen/student_tab.dart';
import 'package:studentappn/widget/task_widget.dart';
import 'package:studentappn/widget/background.dart';
import 'package:studentappn/widget/circleavatar_widget.dart';

class View extends StatelessWidget {
  const View({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 0;
    ListController controller = Get.find();
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 12),
      color: const Color(0xFF2e3253).withOpacity(0.5),
      child: Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );
    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.redAccent,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );

    return Scaffold(
        body: Stack(
      children: [
        const BackGround(Image: "assets/images/list.jpg"),
        // Positioned(
        //   child: CircleAvatarWidget(
        //       onPressed: () => Get.to(StudentTab()),
        //       icon: const Icon(Icons.arrow_back)),
        //   left: 12,
        //   top: 30,
        // ),

        Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  CircleAvatarWidget(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back))
                ],
              ),
              //hiển thị thông tin đã nhập
              Flexible(
                  child: ListView.builder(
                      itemCount: controller.newStudent.length,
                      itemBuilder: ((context, index) {
                        Student value = controller.newStudent[index] as Student;
                        //

                        return Dismissible(
                          background: leftEditIcon,
                          secondaryBackground: rightDeleteIcon,
                          onDismissed: (DismissDirection direction) {
                            controller.removeStudent(index);
                          },
                          confirmDismiss: (DismissDirection direction) async {
                            if (direction == DismissDirection.startToEnd) {
                              //lua chon: xem / chinh sua
                              showBottomSheet(
                                  context: context,
                                  builder: (_) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF2e3253)
                                              .withOpacity(0.4),
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      height: 500,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          //xem
                                          InkWell(
                                            onTap: () {
                                              Get.to(DetailInformation(
                                                index: index,
                                              ));
                                            },
                                            child: const ButtonWidget(
                                                backGroundColor: Colors.blue,
                                                text: 'View',
                                                textColor: Colors.white),
                                          ),

                                          //chinh sua
                                          InkWell(
                                            onTap: () {
                                              controller.newStudent.value[index]
                                                      .index ??
                                                  0;
                                              controller.nameEditingController
                                                      .text =
                                                  controller.newStudent
                                                      .value[index].name;
                                              controller.classEditingController
                                                      .text =
                                                  controller.newStudent
                                                      .value[index].classroom;
                                              controller
                                                      .addressEditingController
                                                      .text =
                                                  controller.newStudent
                                                      .value[index].address;
                                              Get.to(EditInfomation(
                                                  indexn: controller.newStudent
                                                          .value[index].index ??
                                                      0));
                                              Get.toEnd(() => const View());
                                            },
                                            child: const ButtonWidget(
                                                backGroundColor: Colors.blue,
                                                text: 'Edit',
                                                textColor: Colors.white),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                              return false;
                            } else {
                              return Future.delayed(
                                  const Duration(seconds: 1),
                                  () =>
                                      direction == DismissDirection.endToStart);
                            }
                          },
                          key: ObjectKey(index),
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 12),
                            child: TaskWidget(
                                // text: "Name: " + value.name!, color: Colors.blueGrey),
                                text: "Name: " + value.name!,
                                color: Colors.blueGrey),
                          ),
                        );
                      })))
            ],
          ),
        ),
      ],
    ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentappn/student.dart';

class ListController extends GetxController {
  var newStudent = [].obs;

//khai báo cho dropdownbutton
  var selectOptionList = "".obs;
  //List dropDown = ['Kinh', 'Khác'].obs;
  List dropDown = ['Kinh', 'Khác'];
  onChangeDropdown(var nation) {
    selectOptionList.value = nation;
    print('dân tộc là ' + nation);
  }

  //c1 lấy giá trị giới tính được chọn
  var selectedGender = "".obs;
  onChangeGender(var gender) {
    selectedGender.value = gender;
    print('Giới tính là ' + gender);
  }

  //c2
  String _orderType = '_trai';
  String get orderType => _orderType;
  void setOrderType(String type) {
    _orderType = type;
    update();
    print('Gioi tinh là ' + orderType);
  }

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController addressEditingController = TextEditingController();
  TextEditingController classEditingController = TextEditingController();
  late Student student;
  var itemCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onclose() {
    super.onClose();
    nameEditingController.dispose();
    addressEditingController.dispose();
    classEditingController.dispose();
  }

  //Func ADD
  //ADD
  addStudent(var selectedGender, var selectOptionList, String name,
      String address, String classroom) {
    Student student = Student(
        index: newStudent.length + 1,
        name: name,
        address: address,
        classroom: classroom,
        selectedGender: selectedGender,
        selectOptionList: selectOptionList);
    newStudent.add(student);
    print('đã thêm');
    // itemCount.value = newStudent.value.length;
    nameEditingController.clear();
    classEditingController.clear();
    addressEditingController.clear();
  }

  //CLEAR
  removeStudent(int index) {
    var i = 0;
    if (newStudent[i] != 0 && newStudent.length > index) {
      newStudent.removeAt(index);
    }
    update();
  }

  viewStuden(int index, var selectedGender, var selectOptionList, String name,
      String classroom, String address) {
    for (var i = 0; i < newStudent.length; i++) {
      if (newStudent[i].index == index) {
        newStudent[i] = newStudent();
      }

      ;
    }
  }

//update
  updateStuden(int index, var selectedGender, var selectOptionList, String name,
      String classroom, String address) {
    Student newData = Student(
        index: index,
        name: name,
        address: address,
        classroom: classroom,
        selectedGender: selectedGender,
        selectOptionList: selectOptionList);
    for (var i = 0; i < newStudent.length; i++) {
      if (newStudent[i].index == index) {
        newStudent[i] = newData;
      }
    }
    nameEditingController.clear();
    classEditingController.clear();
    addressEditingController.clear();
  }
}
// 

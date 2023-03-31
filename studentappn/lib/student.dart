import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Student {
  final int? index;
  String? name;
  String? address;
  String? classroom;
  //
  var selectedGender;
  var selectOptionList;
  Student({
    @required this.index,
    @required this.name,
    @required this.address,
    @required this.classroom,
    @required this.selectedGender,
    @required this.selectOptionList,
  });
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamia_madrasa/models/ChildDetailsModel.dart';

class ParentDashboardController extends GetxController{
  Rx<TextEditingController> parentNameEditingController = TextEditingController().obs;
  Rx<TextEditingController> parentNumberEditingController = TextEditingController().obs;
  Rx<TextEditingController> parentEmailEditingController = TextEditingController().obs;
  RxList<ChildDetailsModel> childList = <ChildDetailsModel>[].obs;


  loadChild(){
    childList.add(ChildDetailsModel(name: "name", std: "std",address: "",gender: "",city: ""));
  }
}
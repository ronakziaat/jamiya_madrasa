import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamia_madrasa/all_views/maulana/maulana_navigation_screen/MaulanaDashboardScreen.dart';

class MaulanaHomeController extends GetxController{
  Rx<Widget> currentPage = MaulanaDashboardScreen().obs;
  RxString pageTitle = "Home".obs;
  RxInt selectedIndex = 0.obs;
  void selectPage(int index) {

    if(index==0) {
      pageTitle.value = "Home".tr;
      selectedIndex.value = index;
      // currentPage = MaulanaDashboardScreen().obs;
      // update();
    }else if(index==1){
      pageTitle.value = "Attendance".tr;
      selectedIndex.value = index;
      // currentPage = ParentAttendanceScreen().obs;
    }else if(index==2){
      pageTitle.value = "Review".tr;
      selectedIndex.value = index;
      // currentPage.value = ParentReviewScreen();
    }
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamia_madrasa/all_views/parent/parent_navigation_screen/ParentFeeReceiptScreen.dart';
import 'package:jamia_madrasa/all_views/parent/parent_navigation_screen/ParentReviewScreen.dart';

import '../all_views/parent/parent_navigation_screen/ParentAttendanceScreen.dart';
import '../all_views/parent/parent_navigation_screen/ParentDashboardScreen.dart';


class ParentsHomeController extends GetxController{
  Rx<TextEditingController> parentNameEditingController = TextEditingController().obs;
  Rx<TextEditingController> parentNumberEditingController = TextEditingController().obs;
  Rx<TextEditingController> parentEmailEditingController = TextEditingController().obs;

  Rx<Widget> currentPage = ParentDashboardScreen().obs;
  RxString pageTitle = "Home".obs;
  RxInt selectedIndex = 0.obs;
 void selectPage(int index) {

   if(index==0) {
     pageTitle.value = "Home".tr;
     selectedIndex.value = index;
     currentPage = ParentDashboardScreen().obs;
     // update();
   }else if(index==1){
     pageTitle.value = "Attendance".tr;
     selectedIndex.value = index;
     currentPage = ParentAttendanceScreen().obs;
   }else if(index==2){
     pageTitle.value = "Fee Receipt".tr;
     selectedIndex.value = index;
     currentPage.value = ParentFeeReceiptScreen();
   }else if(index==3){
     pageTitle.value = "Review".tr;
     selectedIndex.value = index;
     currentPage.value = ParentReviewScreen();
   }
  }

}
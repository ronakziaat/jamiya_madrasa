import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamia_madrasa/all_controllers/ParentsHomeController.dart';


import 'package:jamia_madrasa/themes/app_them_data.dart';
import 'package:jamia_madrasa/utils/list.dart';

class ParentsHomeScreen extends StatelessWidget {
  const ParentsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ParentsHomeController>(
        init: ParentsHomeController(),
        builder: (controller){
      return Scaffold(
        backgroundColor: AppThemeData.surface,
        appBar: AppBar(
          backgroundColor: AppThemeData.surface,
          title: Text(
            '${controller.pageTitle}',
            style: ibmPlexSansBold.copyWith(fontSize: 20, color: AppThemeData.primary300),
          ),
        ),
        drawer: NavigationDrawer(/*onSelectPage: controller.selectPage*/controller: controller,),
        // Add the drawer here
        body: Obx(()=>controller.currentPage.value),
      );
    });
  }
}
class NavigationDrawer extends StatelessWidget {

  late ParentsHomeController controller;
  // final Function(Widget) onSelectPage;

  NavigationDrawer({required this.controller});

  @override
  Widget build(BuildContext context) {


          return SafeArea(
            child: Container(
              color: Colors.white,
              child: Drawer(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: <Widget>[
                           /* DrawerHeader(
                                decoration: BoxDecoration(
                                  color: AppThemeData.primary300,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 50),
                                        height:100,
                                        width: 170,
                                        // child: Image.asset(logo),
                                      ),
                                    ),
                                  ],
                                )),*/
                            ListTile(
                              tileColor:
                              controller.selectedIndex == 0 ? Colors.grey[300] : Colors.transparent,
                              textColor: controller.selectedIndex == 0 ? AppThemeData.primary300 : Colors.black,
                              title: Text('Home'),
                              onTap: () {
                                controller.selectPage(0);
                                Get.back();
                              },
                            ),
                            ListTile(
                              tileColor:
                              controller.selectedIndex == 1 ? Colors.grey[300] : Colors.transparent,
                              textColor: controller.selectedIndex == 1 ? AppThemeData.primary300 : Colors.black,
                              title: Text('Attendance'),
                              onTap: () {
                                controller.selectPage(1);
                                Get.back();
                              },
                            ),

                            ListTile(
                              tileColor:
                              controller.selectedIndex == 2 ? Colors.grey[300] : Colors.transparent,
                              textColor: controller.selectedIndex == 2 ? AppThemeData.primary300 : Colors.black,
                              title: Text('Fee Receipt'),
                              onTap: () {
                                controller.selectPage(2);
                                Get.back();
                              },
                            ),
                            ListTile(
                              tileColor:
                              controller.selectedIndex == 3 ? Colors.grey[300] : Colors.transparent,
                              textColor: controller.selectedIndex == 3 ? AppThemeData.primary300 : Colors.black,
                              title: Text('Review'),
                              onTap: () {
                                controller.selectPage(3);
                                Get.back();
                              },
                            ),


                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          );

  }

}

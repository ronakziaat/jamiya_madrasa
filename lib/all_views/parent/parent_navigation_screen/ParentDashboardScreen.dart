import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamia_madrasa/all_controllers/ParentDashboardController.dart';
import 'package:jamia_madrasa/themes/TextFieldWidget.dart';
import 'package:jamia_madrasa/themes/app_them_data.dart';
import 'package:jamia_madrasa/utils/list.dart';

class ParentDashboardScreen extends StatelessWidget {
  const ParentDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ParentDashboardController>(
        init: ParentDashboardController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppThemeData.pageBg,
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  gradient: AppThemeData.firstAppGradient,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Parent Information".tr,
                          style: TextStyle(
                            fontSize: 20,
                            color: AppThemeData.grey900,
                            fontFamily: AppThemeData.semiBold,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
                          decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(10),border: Border.all(color: AppThemeData.grey400,width: 0.8)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Parent\'S Name".tr,
                                style: robotoW700.copyWith(
                                    fontSize: 12, color: Colors.black),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${controller.parentNameEditingController.value.text}"
                                          .tr,
                                      style: robotoW600.copyWith(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Parent\'S Mobile Number".tr,
                                style: robotoW700.copyWith(
                                    fontSize: 12, color: Colors.black),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${controller.parentNumberEditingController.value.text}"
                                          .tr,
                                      style: robotoW600.copyWith(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Parent\'S Email".tr,
                                style: robotoW700.copyWith(
                                    fontSize: 12, color: Colors.black),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${controller.parentEmailEditingController.value.text}"
                                          .tr,
                                      style: robotoW600.copyWith(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),


                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Children Information".tr,
                          style: TextStyle(
                            fontSize: 20,
                            color: AppThemeData.grey900,
                            fontFamily: AppThemeData.semiBold,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ChildrenItem(controller: controller),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class ChildrenItem extends StatelessWidget {
  final ParentDashboardController controller;

  const ChildrenItem({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    controller.loadChild();
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: 10,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              padding: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color:Colors.white,
                    // AppThemeData.bgColors[index % AppThemeData.bgColors.length],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black,width: 0.5,)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Student ".tr,maxLines: 1,overflow: TextOverflow.ellipsis,
                                style: robotoW500.copyWith(
                                    fontSize: 13, color: Colors.black),
                              ),
                            ),
                          ],
                        ),SizedBox(
                          height: 5,
                        ),
                        Divider(height: 1,),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "Class : A ".tr,
                              style: robotoW500.copyWith(
                                  fontSize: 13, color: Colors.black),
                            ),

                          ],
                        ),

                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Address : A ".tr,
                                style: robotoW500.copyWith(
                                    fontSize: 13, color: Colors.black),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "City : A ".tr,
                              style: robotoW500.copyWith(
                                  fontSize: 13, color: Colors.black),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

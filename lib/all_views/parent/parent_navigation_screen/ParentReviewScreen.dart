import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamia_madrasa/all_controllers/ParentReviewController.dart';
import 'package:jamia_madrasa/themes/app_them_data.dart';

class ParentReviewScreen extends StatelessWidget {
  const ParentReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ParentReviewController>(
        init: ParentReviewController(),
        builder: (controller){
          return Scaffold(
            backgroundColor: AppThemeData.pageBg,
            body: SafeArea(child: Container(
              decoration: BoxDecoration(
                gradient: AppThemeData.firstAppGradient,
              ),
            )),
          );
    });
  }
}

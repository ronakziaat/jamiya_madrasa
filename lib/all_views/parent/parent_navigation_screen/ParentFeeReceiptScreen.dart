import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamia_madrasa/all_controllers/ParentFeeReceiptController.dart';
import 'package:jamia_madrasa/themes/app_them_data.dart';

class ParentFeeReceiptScreen extends StatelessWidget {
  const ParentFeeReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ParentFeeReceiptController>(
        init: ParentFeeReceiptController(),
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

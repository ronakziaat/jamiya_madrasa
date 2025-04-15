
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamia_madrasa/all_controllers/SplashController.dart';
import 'package:jamia_madrasa/themes/app_them_data.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppThemeData.primary300,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset("assets/images/ic_logo.png"),
                const SizedBox(height: 10,),
                Text(
                  "Welcome\nto\nJamia Madrasa",
                  style: TextStyle(color:  AppThemeData.grey50, fontSize: 28, fontFamily: AppThemeData.bold,),textAlign: TextAlign.center,
                ),
                /*Text(
                  "Your Favorite Food Delivered Fast!".tr,
                  style: TextStyle(color:  AppThemeData.grey50),
                ),*/
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'dart:async';
import 'package:get/get.dart';
import 'package:jamia_madrasa/all_views/auth_screen/phone_number_screen.dart';
import 'package:jamia_madrasa/all_views/parent/ParentsHomeScreen.dart';

import '../utils/preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () => redirectScreen());
    super.onInit();
  }

  redirectScreen() async {
    Get.offAll(const PhoneNumberScreen());
   /* if (Preferences.getBoolean(Preferences.isFinishOnBoardingKey) == false) {
      Get.offAll(const OnBoardingScreen());
    } else {*/
      bool isLogin = false/*await FireStoreUtils.isLogin()*/;
      /*if (isLogin == true) {
      *//*  await FireStoreUtils.getUserProfile(FireStoreUtils.getCurrentUid()).then((value) async {
          if (value != null) {
            UserModel userModel = value;
            log(userModel.toJson().toString());
            if (userModel.role == Constant.userRoleCustomer) {
              if (userModel.active == true) {
                userModel.fcmToken = await NotificationService.getToken();
                await FireStoreUtils.updateUser(userModel);
                if (userModel.shippingAddress != null && userModel.shippingAddress!.isNotEmpty) {
                  if (userModel.shippingAddress!.where((element) => element.isDefault == true).isNotEmpty) {
                    Constant.selectedLocation = userModel.shippingAddress!.where((element) => element.isDefault == true).single;
                  } else {
                    Constant.selectedLocation = userModel.shippingAddress!.first;
                  }
                  if( Preferences.getBoolean(Preferences.acceptturmCondition)) {
                    Get.offAll(
                        DashBoardScreen());
                  }else{
                    Get.offAll(
                        TermsAndConditionScreenNew(
                          userModel: userModel,));
                  }
                } else {
                  if( Preferences.getBoolean(Preferences.acceptturmCondition)) {
                    Get.offAll(
                        LocationPermissionScreen());
                  }else{
                    Get.offAll(
                        TermsAndConditionScreenNew(
                          userModel: userModel,));
                  }
                }
              } else {
                await FirebaseAuth.instance.signOut();
                Get.offAll(const LoginScreen());
              }
            } else {
              await FirebaseAuth.instance.signOut();
              Get.offAll(const LoginScreen());
            }
          }
        });*//*
        Get.offAll(const PhoneNumberScreen());
      } else {
        // await FirebaseAuth.instance.signOut();
        Get.offAll(const PhoneNumberScreen());
      }*/
    // }
  }
}

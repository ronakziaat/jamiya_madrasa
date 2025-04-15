
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamia_madrasa/all_views/auth_screen/otp_screen.dart';
import 'package:jamia_madrasa/utils/ShowToastDialog.dart';

class PhoneNumberController extends GetxController {
  Rx<TextEditingController> phoneNUmberEditingController = TextEditingController().obs;
  Rx<TextEditingController> countryCodeEditingController = TextEditingController().obs;


  sendCode() async {
    Get.to(const OtpScreen(), arguments: {
      "countryCode": countryCodeEditingController.value.text,
      "phoneNumber": phoneNUmberEditingController.value.text,
      // "verificationId": verificationId,
    });
    // ShowToastDialog.showLoader("Please wait".tr);
   /* await FirebaseAuth.instance
        .verifyPhoneNumber(
        phoneNumber: countryCodeEditingController.value.text + phoneNUmberEditingController.value.text,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          debugPrint("FirebaseAuthException--->${e.message}");
          ShowToastDialog.closeLoader();
          if (e.code == 'invalid-phone-number') {
            ShowToastDialog.showToast("invalid_phone_number".tr);
          } else {
            ShowToastDialog.showToast(e.message);
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          ShowToastDialog.closeLoader();*/

       /* },
        codeAutoRetrievalTimeout: (String verificationId) {})
        .catchError((error) {
      debugPrint("catchError--->$error");
      ShowToastDialog.closeLoader();
      ShowToastDialog.showToast("multiple_time_request".tr);
    });*/
  }
}

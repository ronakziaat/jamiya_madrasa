import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamia_madrasa/all_controllers/OtpController.dart';
import 'package:jamia_madrasa/all_views/parent/ParentsHomeScreen.dart';
import 'package:jamia_madrasa/constant/constant.dart';
import 'package:jamia_madrasa/themes/RoundedButtonFill.dart';
import 'package:jamia_madrasa/themes/app_them_data.dart';
import 'package:jamia_madrasa/utils/ShowToastDialog.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<OtpController>(
        init: OtpController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppThemeData.surface,
            appBar: AppBar(
              backgroundColor: AppThemeData.surface,
            ),
            body: controller.isLoading.value
                ? Constant.loader()
                : Container(
                    decoration: BoxDecoration(
                      gradient: AppThemeData.firstAppGradient,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Verify Your Number 📱".tr,
                            style: TextStyle(
                                color: AppThemeData.grey900,
                                fontSize: 22,
                                fontFamily: AppThemeData.semiBold),
                          ),
                          Text(
                            "Enter the OTP sent to your mobile number. ${controller.countryCode.value} ${Constant.maskingString(controller.phoneNumber.value, 3)}"
                                .tr,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppThemeData.grey700,
                              fontSize: 16,
                              fontFamily: AppThemeData.regular,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            child: PinCodeTextField(
                              length: 6,
                              appContext: context,
                              keyboardType: TextInputType.phone,
                              enablePinAutofill: true,
                              hintCharacter: "-",
                              textStyle: TextStyle(
                                  color: AppThemeData.grey900,
                                  fontFamily: AppThemeData.regular),
                              pinTheme: PinTheme(
                                  fieldHeight: 50,
                                  fieldWidth: 50,
                                  inactiveFillColor: AppThemeData.grey50,
                                  selectedFillColor: AppThemeData.grey50,
                                  activeFillColor: AppThemeData.grey50,
                                  selectedColor: AppThemeData.grey50,
                                  activeColor: AppThemeData.primary300,
                                  inactiveColor: AppThemeData.grey50,
                                  disabledColor: AppThemeData.grey50,
                                  shape: PinCodeFieldShape.box,
                                  errorBorderColor: AppThemeData.grey300,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              cursorColor: AppThemeData.primary300,
                              enableActiveFill: true,
                              controller: controller.otpController.value,
                              onCompleted: (v) async {},
                              onChanged: (value) {},
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          RoundedButtonFill(
                            title: "Verify & Next".tr,
                            color: AppThemeData.primary300,
                            textColor: AppThemeData.grey50,
                            onPress: () async {
                              if (controller
                                      .otpController.value.text.length ==
                                  6) {
                                ShowToastDialog.showLoader("Verify otp".tr);
                                ShowToastDialog.closeLoader();
                                Get.offAll(const ParentsHomeScreen());
                              } else {
                                ShowToastDialog.showToast(
                                    "Enter Valid otp".tr);
                              }
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text.rich(
                            textAlign: TextAlign.start,
                            TextSpan(
                              text: "${'Did’t receive any code? '.tr} ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: AppThemeData.medium,
                                color: AppThemeData.grey800,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      controller.otpController.value.clear();
                                      controller.sendOTP();
                                    },
                                  text: 'Send Again'.tr,
                                  style: TextStyle(
                                      color: AppThemeData.primary300,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      fontFamily: AppThemeData.medium,
                                      decoration: TextDecoration.underline,
                                      decorationColor:
                                          AppThemeData.primary300),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          );
        });
  }
}

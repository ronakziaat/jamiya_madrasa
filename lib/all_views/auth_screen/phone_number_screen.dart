import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:jamia_madrasa/all_controllers/PhoneNumberController.dart';
import 'package:jamia_madrasa/themes/RoundedButtonFill.dart';
import 'package:jamia_madrasa/themes/TextFieldWidget.dart';
import 'package:jamia_madrasa/themes/app_them_data.dart';
import 'package:jamia_madrasa/utils/ShowToastDialog.dart';
import 'package:provider/provider.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return GetX(
        init: PhoneNumberController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppThemeData.surface,
           
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.only(top: 80),
                decoration: BoxDecoration(
                  gradient: AppThemeData.firstAppGradient,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome ".tr,
                        style: TextStyle(
                            color: AppThemeData.grey900,
                            fontSize: 22,
                            fontFamily: AppThemeData.semiBold),
                      ),
                      Text(
                        "Log in to continue ".tr,
                        style: TextStyle(
                            color: AppThemeData.grey500,
                            fontSize: 16,
                            fontFamily: AppThemeData.regular),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      TextFieldWidget(
                        title: 'Phone Number'.tr,
                        controller:
                            controller.phoneNUmberEditingController.value,maxLength: 10,
                        hintText: 'Enter Phone Number'.tr,
                        textInputType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        textInputAction: TextInputAction.done,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                        ],
                        prefix: CountryCodePicker(
                          onChanged: (value) {
                            controller.countryCodeEditingController.value.text =
                                value.dialCode.toString();
                          },
                          enabled: false,
                          dialogTextStyle: TextStyle(
                              color: AppThemeData.grey900,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppThemeData.medium),
                          dialogBackgroundColor: AppThemeData.grey100,
                          initialSelection:
                              'IN' /*controller.countryCodeEditingController.value.text*/,
                          comparator: (a, b) =>
                              b.name!.compareTo(a.name.toString()),
                          textStyle: TextStyle(
                              fontSize: 14,
                              color: AppThemeData.grey900,
                              fontFamily: AppThemeData.medium),
                          searchDecoration:
                              InputDecoration(iconColor: AppThemeData.grey900),
                          searchStyle: TextStyle(
                              color: AppThemeData.grey900,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppThemeData.medium),
                        ),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      RoundedButtonFill(
                        title: "Send OTP".tr,
                        color: AppThemeData.primary300,
                        textColor: AppThemeData.grey50,
                        onPress: () async {
                          if (controller
                              .phoneNUmberEditingController.value.text.isEmpty) {
                            ShowToastDialog.showToast(
                                "Please enter mobile number".tr);
                          } else {
                            controller.sendCode();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(

              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: Platform.isAndroid ? 10 : 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Didn’t have an account?'.tr,
                              style: TextStyle(
                                color: AppThemeData.grey900,
                                fontFamily: AppThemeData.medium,
                                fontWeight: FontWeight.w500,
                              )),
                          const WidgetSpan(
                              child: SizedBox(
                            width: 10,
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

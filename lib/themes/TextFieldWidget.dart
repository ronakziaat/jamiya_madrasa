
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jamia_madrasa/themes/app_them_data.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {
  final String? title;
  final String hintText;
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? suffix;
  final bool? enable;
  final bool? obscureText;
  final int? maxLine;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onchange;
  final TextInputAction? textInputAction;
  final int? maxLength;

  const TextFieldWidget({
    super.key,
    this.textInputType,
    this.enable,
    this.obscureText,
    this.prefix,
    this.suffix,
    this.title,
    required this.hintText,
    required this.controller,
    this.maxLine,
    this.inputFormatters,
    this.onchange,
    this.textInputAction,this.maxLength
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: title != null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title ?? "".tr ?? '',
                    style: TextStyle(fontFamily: AppThemeData.medium, fontSize: 14, color:  AppThemeData.grey900)),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          TextFormField(
            keyboardType: textInputType ?? TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            controller: controller,
            maxLines: maxLine ?? 1,
            textInputAction: textInputAction ?? TextInputAction.done,
            inputFormatters: inputFormatters,
            obscureText: obscureText ?? false,
            obscuringCharacter: '●',
            onChanged: onchange,
            style: TextStyle(color:  AppThemeData.grey900, fontFamily: AppThemeData.medium),maxLength: maxLength,
            decoration: InputDecoration(
              errorStyle: const TextStyle(color: Colors.red),
              filled: true,
              enabled: enable ?? true,
              contentPadding: EdgeInsets.symmetric(
                  vertical: title == null
                      ? 12
                      : enable == false
                      ? 13
                      : 8,
                  horizontal: 10),
              fillColor:  AppThemeData.grey50,
              prefixIcon: prefix,
              suffixIcon: suffix,
              disabledBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color:  AppThemeData.grey50, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color:  AppThemeData.primary300, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color:  AppThemeData.grey50, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color:  AppThemeData.grey50, width: 1),
              ),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color:  AppThemeData.grey50, width: 1),
              ),
              hintText: hintText.tr,
              hintStyle: TextStyle(
                fontSize: 14,
                color:  AppThemeData.grey400,
                fontFamily: AppThemeData.regular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profile_student/styles/colors.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/widgets/inputs/input_primary.dart';

class InputPhone extends StatefulWidget {
  const InputPhone({
    Key? key,
    required this.controller,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.color,
    this.textColor = AppColor.primaryColor,
    this.margin,
    this.padding,
    this.enable = true,
    this.validation,
    this.inputFormatters,
    this.hint = '08xx xxxx xxxx',
    this.validationText = '',
    this.textStyle,
    this.hintStyle,
    this.errorTextStyle,
    this.maxLength = 50,
    this.value,
    this.inputStyle = InputStyle.box,
    this.withCountryCode = false,
    this.outlineColor,
    this.borderRadius,
    this.hintColor,
  }) : super(key: key);

  final TextEditingController controller;
  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? color;
  final Color textColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool enable;
  final bool? Function(String value)? validation;
  final List<TextInputFormatter>? inputFormatters;
  final String hint;
  final String validationText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorTextStyle;
  final int maxLength;
  final ValueSetter<String>? value;
  final InputStyle inputStyle;
  final bool withCountryCode;
  final Color? outlineColor;
  final double? borderRadius;
  final Color? hintColor;

  @override
  InputPhoneState createState() => InputPhoneState();
}

class InputPhoneState extends State<InputPhone> {
  String countryCode = '+62';
  bool? Function(String value)? validation;
  String validateText = '';

  @override
  void initState() {
    super.initState();
    if (widget.validation == null) {
      validation = GetUtils.isPhoneNumber;
    } else {
      validation = widget.validation;
    }

    if (widget.validationText.isEmpty) {
      validateText = 'Invalid phone number';
    } else {
      validateText = widget.validationText;
    }
  }

  _onChanged(String value) {
    if (value.isNotEmpty) {
      final val = value.removeAllWhitespace;
      if (widget.value != null) {
        if (widget.withCountryCode) {
          widget.value!(countryCode.replaceAll('+', '') + val);
        } else {
          widget.value!(val);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InputPrimary(
      controller: widget.controller,
      hint: widget.hint,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        TextInputMask(mask: '9999 9999 9999 9999 9999')
      ],
      keyboardType: TextInputType.number,
      label: widget.label,
      inputStyle: widget.inputStyle,
      prefixIcon: widget.withCountryCode
          ? Container(
              width: 50.w,
              height: 44.w,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 12.w),
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Text(
                countryCode,
                textAlign: TextAlign.center,
                style: TextStyles.desc.copyWith(color: Colors.black),
              ),
            )
          : widget.prefixIcon,
      suffixIcon: widget.suffixIcon,
      color: widget.color,
      textColor: widget.textColor,
      margin: widget.margin,
      padding: widget.padding,
      enable: widget.enable,
      validation: validation,
      validationText: validateText,
      textStyle: widget.textStyle,
      hintStyle: widget.hintStyle,
      errorTextStyle: widget.errorTextStyle,
      maxLength: widget.maxLength,
      onChanged: _onChanged,
      outlineColor: widget.outlineColor,
      borderRadius: widget.borderRadius,
      hintColor: widget.hintColor,
    );
  }
}

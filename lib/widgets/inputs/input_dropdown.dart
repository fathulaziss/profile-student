import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_student/styles/colors.dart';
import 'package:profile_student/styles/styles.dart';

class InputDropdown extends StatelessWidget {
  const InputDropdown({
    Key? key,
    this.title = '',
    this.hintText,
    required this.items,
    required this.selectedItem,
    this.onChanged,
    this.titleColor = AppColor.primaryColor,
    this.borderColor,
    this.outlinedBorderColor,
    this.textAlign,
  }) : super(key: key);

  final String title;
  final String? hintText;
  final List<DropdownMenuItem<Object>> items;
  final String selectedItem;
  final Function(Object?)? onChanged;
  final Color titleColor;
  final Color? borderColor;
  final Color? outlinedBorderColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: Insets.xs),
            child: Text(
              title,
              style: TextStyles.desc.copyWith(color: titleColor),
            ),
          ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: borderColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(Corners.sm),
            border:
                Border.all(color: outlinedBorderColor ?? Colors.grey.shade300),
          ),
          child: DropdownButton2(
            underline: const SizedBox(),
            customButton: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedItem.isNotEmpty
                        ? selectedItem
                        : hintText ?? 'Choose Item',
                    textAlign: textAlign ?? TextAlign.left,
                    style: TextStyles.text.copyWith(
                      color: selectedItem.isNotEmpty
                          ? AppColor.primaryColor
                          : Colors.grey,
                    ),
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down, color: Colors.grey)
              ],
            ),
            scrollbarAlwaysShow: false,
            itemHeight: 45.w,
            dropdownMaxHeight: 45.w * items.length,
            items: items,
            onChanged: onChanged,
          ),
        ),
        verticalSpace(Insets.xs),
      ],
    );
  }
}

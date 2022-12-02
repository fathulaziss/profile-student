import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/utils/app_asset.dart';

class DataDiriDropdownItem extends StatelessWidget {
  const DataDiriDropdownItem({
    Key? key,
    required this.value,
    required this.isSelected,
  }) : super(key: key);

  final String value;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Flex(
      crossAxisAlignment: CrossAxisAlignment.start,
      direction: Axis.vertical,
      children: [
        Expanded(
          child: Row(
            children: [
              if (isSelected)
                SizedBox.square(
                  dimension: 20.w,
                  child: Image.asset(AppAsset.icon('ic_circle_check.png')),
                )
              else
                SizedBox.square(
                  dimension: 20.w,
                  child: Image.asset(AppAsset.icon('ic_circle_uncheck.png')),
                ),
              horizontalSpace(12.w),
              Text(value, style: TextStyles.text),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

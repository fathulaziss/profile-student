import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profile_student/app/modules/data_diri/controllers/data_diri_controller.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/utils/app_asset.dart';

class DataDiriDropdownItem extends GetView<DataDiriController> {
  const DataDiriDropdownItem({
    Key? key,
    required this.value,
  }) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.vertical,
        children: [
          Expanded(
            child: Row(
              children: [
                if (controller.selectedJenisKelamin.value == value)
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
      ),
    );
  }
}

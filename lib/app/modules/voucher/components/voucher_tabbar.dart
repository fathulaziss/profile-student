import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profile_student/app/modules/voucher/controllers/voucher_controller.dart';
import 'package:profile_student/styles/colors.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/widgets/buttons/button_primary.dart';

class VoucherTabbar extends GetView<VoucherController> {
  const VoucherTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.all(Insets.sm),
        decoration: BoxDecoration(
          borderRadius: Corners.xxlBorder,
          color: const Color(0xFFF8F9FE),
        ),
        child: Row(
          children: [
            Expanded(
              child: ButtonPrimary(
                label: 'Kupon Instruktur',
                textStyle: TextStyles.title.copyWith(
                  fontSize: 12.w,
                  color: controller.tabbarIndex.value == 0
                      ? Colors.white
                      : const Color(0xFFA5ADBB),
                ),
                color: controller.tabbarIndex.value == 0
                    ? AppColor.primaryColor
                    : Colors.transparent,
                onTap: () {
                  controller.tabbarIndex(0);
                },
              ),
            ),
            Expanded(
              child: ButtonPrimary(
                label: 'Kupon Lainnya',
                textStyle: TextStyles.title.copyWith(
                  fontSize: 12.w,
                  color: controller.tabbarIndex.value == 1
                      ? Colors.white
                      : const Color(0xFFA5ADBB),
                ),
                color: controller.tabbarIndex.value == 1
                    ? AppColor.primaryColor
                    : Colors.transparent,
                onTap: () {
                  controller.tabbarIndex(1);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

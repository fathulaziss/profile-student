import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profile_student/app/modules/voucher/models/voucher_model.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/utils/app_asset.dart';

class VoucherItem extends StatelessWidget {
  const VoucherItem({super.key, required this.data});

  final VoucherModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(color: Color(0xFFF8F9FE)),
      margin: EdgeInsets.only(bottom: Insets.lg),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox.square(
                      dimension: 50.w,
                      child: Image.asset(
                        AppAsset.image(data.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    horizontalSpace(10.w),
                    Expanded(
                      child: Text(
                        data.title,
                        style: TextStyles.title.copyWith(fontSize: 16.w),
                      ),
                    )
                  ],
                ),
                const Divider(color: Color(0xFFD8D8D8), thickness: 1),
                verticalSpace(Insets.sm),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Berakhir : ${data.expired}',
                      style: TextStyles.desc.copyWith(
                        color: data.expired.contains('jam')
                            ? Colors.red
                            : Colors.black,
                      ),
                    ),
                    Text(
                      'S&K',
                      style: TextStyles.title
                          .copyWith(fontSize: 12.w, color: Colors.red),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: -5.w,
            left: -5.w,
            child: Container(
              width: 25.w,
              height: 25.w,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: Shadows.small,
                border: Border.all(color: Colors.grey.shade300),
              ),
            ),
          ),
          Positioned(
            bottom: -5.w,
            left: -5.w,
            child: Container(
              width: 25.w,
              height: 25.w,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: Shadows.small,
                border: Border.all(color: Colors.grey.shade300),
              ),
            ),
          ),
          Positioned(
            top: -5.w,
            right: -5.w,
            child: Container(
              width: 25.w,
              height: 25.w,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: Shadows.small,
                border: Border.all(color: Colors.grey.shade300),
              ),
            ),
          ),
          Positioned(
            bottom: -5.w,
            right: -5.w,
            child: Container(
              width: 25.w,
              height: 25.w,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: Shadows.small,
                border: Border.all(color: Colors.grey.shade300),
              ),
            ),
          ),
          Positioned(
            top: -10,
            right: 60.w,
            child: Container(
              width: 25.w,
              height: 25.w,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: Shadows.small,
                border: Border.all(color: Colors.grey.shade300),
              ),
            ),
          ),
          Positioned(
            bottom: -10,
            right: 60.w,
            child: Container(
              width: 25.w,
              height: 25.w,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: Shadows.small,
                border: Border.all(color: Colors.grey.shade300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/utils/app_asset.dart';

class TabProfileMenu extends StatelessWidget {
  const TabProfileMenu({
    super.key,
    required this.onTap,
    required this.icon,
    required this.label,
    this.isShowArrow = false,
  });

  final Function() onTap;
  final String label;
  final String icon;
  final bool isShowArrow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SizedBox(
          width: Get.width,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Row(
                  children: [
                    SizedBox.square(
                      dimension: 24.w,
                      child: Image.asset(AppAsset.icon(icon)),
                    ),
                    horizontalSpace(10.w),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            label,
                            style: TextStyles.title.copyWith(fontSize: 15.w),
                          ),
                          if (isShowArrow)
                            Icon(Icons.arrow_forward_ios, size: 18.w)
                          else
                            const SizedBox()
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Divider(color: Color(0xFFA5ADBB)),
            ],
          ),
        ),
      ),
    );
  }
}

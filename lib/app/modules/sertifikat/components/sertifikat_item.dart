import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/utils/app_asset.dart';

class SertifikatItem extends StatelessWidget {
  const SertifikatItem({
    super.key,
    required this.author,
    required this.date,
    required this.title,
  });

  final String title;
  final String author;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 200.w,
      margin: EdgeInsets.only(bottom: Insets.xl),
      decoration: BoxDecoration(
        borderRadius: Corners.lgBorder,
        image: DecorationImage(
          image: AssetImage(AppAsset.image('img_sertifikat.png')),
        ),
        boxShadow: Shadows.universal,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: Get.width,
            height: 90.w,
            padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Corners.lgRadius,
                bottomRight: Corners.lgRadius,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.35),
                  blurRadius: 5,
                  offset: const Offset(0, -3),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyles.title.copyWith(fontSize: 12.w),
                ),
                verticalSpace(Insets.xs),
                Text(
                  author,
                  style: TextStyles.text.copyWith(
                    fontSize: 10.w,
                    color: const Color(0xFF747474),
                  ),
                ),
                verticalSpace(Insets.sm),
                Text(
                  date,
                  style: TextStyles.text.copyWith(
                    fontSize: 10.w,
                    color: const Color(0xFF747474),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

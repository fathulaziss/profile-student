import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_student/styles/colors.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/utils/app_asset.dart';

class TabProfileInfo extends StatelessWidget {
  const TabProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: DottedBorder(
          borderType: BorderType.RRect,
          dashPattern: const [15, 5],
          color: const Color(0xFF3A83D1),
          radius: Corners.medRadius,
          padding: EdgeInsets.zero,
          child: ClipRRect(
            borderRadius: Corners.medBorder,
            child: Padding(
              padding: EdgeInsets.all(Insets.med),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Data Diri',
                    style: TextStyles.title.copyWith(fontSize: 16.w),
                  ),
                  verticalSpace(Insets.xs),
                  Text(
                    'Lengkapi data diri untuk kami mengidentifikasi anda',
                    style: TextStyles.desc
                        .copyWith(color: const Color(0xFFA5ADBB)),
                  ),
                  verticalSpace(Insets.xs),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lengkapi sekarang',
                        style: TextStyles.title.copyWith(
                          color: AppColor.primaryColor,
                          fontSize: 12.w,
                        ),
                      ),
                      Image.asset(
                        AppAsset.icon('ic_arrow_forward.png'),
                        width: 24.w,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

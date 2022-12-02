import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_student/app/modules/edit_profile/views/edit_profile_view.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/utils/app_asset.dart';

class TabProfileHeader extends StatelessWidget {
  const TabProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 228.w,
      margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Color(0xFF0753B3),
            Color(0xFF5BA2E4),
          ],
        ),
      ),
      child: Stack(
        children: [
          Align(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.w),
                  child: Text(
                    'Profile',
                    style: TextStyles.title
                        .copyWith(fontSize: 20.w, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 84.w,
                  height: 84.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AppAsset.image('img_profile.png')),
                    ),
                  ),
                ),
                verticalSpace(Insets.med),
                Text(
                  'Muhammad Saitama',
                  style: TextStyles.title
                      .copyWith(fontSize: 14.w, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(Insets.med),
                Text(
                  'Belum Diverifikasi',
                  style: TextStyles.title.copyWith(
                    fontSize: 14.w,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            top: 13.w,
            right: 20.w,
            child: IconButton(
              // onPressed: () => Get.toNamed(Routes.EDIT_PROFILE),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfileView(),
                  ),
                );
              },
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(minHeight: 24.w),
              icon: SizedBox.square(
                dimension: 24.w,
                child: Image.asset(AppAsset.icon('ic_edit.png')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

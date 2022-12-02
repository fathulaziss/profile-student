import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_student/app/modules/edit_profile/components/edit_profile_photo.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/utils/app_asset.dart';
import 'package:profile_student/widgets/others/bottomsheet_custom.dart';

class EditProfileHeader extends StatelessWidget {
  const EditProfileHeader({
    super.key,
    required this.onTapCamera,
    required this.onTapGallery,
    required this.onTapRemove,
    required this.photoProfileEdited,
  });

  final String photoProfileEdited;
  final Function() onTapCamera;
  final Function() onTapGallery;
  final Function() onTapRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 228.w,
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
                    'Edit Profile',
                    style: TextStyles.title
                        .copyWith(fontSize: 20.w, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 13.w,
            left: 20.w,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(minHeight: 24.w),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
          Align(
            child: InkWell(
              onTap: () {
                BottomSheetCustom(
                  context: context,
                  initialChildSize: 0.3,
                  child: EditProfilePhoto(
                    onTapCamera: onTapCamera,
                    onTapGallery: onTapGallery,
                    onTapRemove: onTapRemove,
                  ),
                ).showData();
              },
              child: Container(
                width: 84.w,
                height: 84.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: photoProfileEdited.isEmpty
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppAsset.image('img_profile.png')),
                        )
                      : DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(File(photoProfileEdited)),
                        ),
                ),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    SizedBox.square(
                      dimension: 24.w,
                      child: Image.asset(
                        AppAsset.icon('ic_camera.png'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_student/app/modules/data_diri/components/data_diri_photo.dart';
import 'package:profile_student/app/modules/data_diri/controllers/data_diri_controller.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/utils/app_asset.dart';
import 'package:profile_student/widgets/others/bottomsheet_custom.dart';

class DataDiriHeader extends GetView<DataDiriController> {
  const DataDiriHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: Get.width,
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
                onPressed: Get.back,
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
                    child: DataDiriPhoto(
                      onTapCamera: () {
                        controller.changeProfile(ImageSource.camera);
                      },
                      onTapGallery: () {
                        controller.changeProfile(ImageSource.gallery);
                      },
                      onTapRemove: () {
                        controller.photoProfileEdited('');
                      },
                    ),
                  ).showData();
                },
                child: Container(
                  width: 84.w,
                  height: 84.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: controller.photoProfileEdited.value.isEmpty
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage(AppAsset.image('img_profile.png')),
                          )
                        : DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(
                              File(controller.photoProfileEdited.value),
                            ),
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/utils/app_asset.dart';

class DataDiriPhoto extends StatelessWidget {
  const DataDiriPhoto({
    super.key,
    required this.onTapCamera,
    required this.onTapGallery,
    required this.onTapRemove,
  });

  final Function() onTapCamera;
  final Function() onTapGallery;
  final Function() onTapRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Edit Banner',
          style: TextStyles.title.copyWith(fontSize: 14.w, color: Colors.black),
        ),
        verticalSpace(Insets.med),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 88.w,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      onTapCamera();
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.zero,
                    icon: SizedBox.square(
                      dimension: 55.w,
                      child: Image.asset(
                        AppAsset.icon('ic_camera2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  verticalSpace(10.w),
                  Text(
                    'Camera',
                    style: TextStyles.desc.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 88.w,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      onTapGallery();
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.zero,
                    icon: SizedBox.square(
                      dimension: 55.w,
                      child: Image.asset(
                        AppAsset.icon('ic_gallery.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  verticalSpace(10.w),
                  Text(
                    'Gallery',
                    style: TextStyles.desc.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 88.w,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      onTapRemove();
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.zero,
                    icon: SizedBox.square(
                      dimension: 55.w,
                      child: Image.asset(
                        AppAsset.icon('ic_remove.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  verticalSpace(10.w),
                  Text(
                    'Remove Photo',
                    style: TextStyles.desc.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

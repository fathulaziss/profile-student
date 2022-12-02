import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_student/app/modules/sertifikat/components/sertifikat_item.dart';
import 'package:profile_student/styles/styles.dart';

class SertifikatView extends StatelessWidget {
  const SertifikatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Sertifikat Saya',
          style: TextStyles.title.copyWith(fontSize: 14.w),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.w,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: const [
            SertifikatItem(
              author: 'by. Jennie Argyanti',
              date: '30 September 2022',
              title: 'Website: Full-Stack Web Developer',
            ),
            SertifikatItem(
              author: 'by. Jisoo Rizatunnisa',
              date: '10 September 2022',
              title: 'Jago Email Marketing',
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_student/app/modules/home/components/tab_profile_header.dart';
import 'package:profile_student/app/modules/home/components/tab_profile_info.dart';
import 'package:profile_student/app/modules/home/components/tab_profile_menu.dart';
import 'package:profile_student/styles/styles.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TabProfileHeader(),
          verticalSpace(20.w),
          const TabProfileInfo(),
          verticalSpace(10.w),
          TabProfileMenu(
            onTap: () {},
            icon: 'ic_saldo.png',
            label: 'Saldo',
          ),
          TabProfileMenu(
            onTap: () {},
            icon: 'ic_voucher.png',
            label: 'Voucher Kamu',
          ),
          TabProfileMenu(
            onTap: () {},
            icon: 'ic_sertifikat.png',
            label: 'Sertifikat',
          ),
          TabProfileMenu(
            onTap: () {},
            icon: 'ic_help.png',
            label: 'Butuh Bantuan? Hubungi Kami',
          ),
          TabProfileMenu(
            onTap: () {},
            icon: 'ic_privacy_security.png',
            label: 'Privasi dan Keamanan',
            isShowArrow: true,
          ),
          verticalSpace(88.w)
        ],
      ),
    );
  }
}

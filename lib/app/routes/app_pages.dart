import 'package:get/get.dart';
import 'package:profile_student/app/modules/data_diri/bindings/data_diri_binding.dart';
import 'package:profile_student/app/modules/data_diri/views/data_diri_view.dart';
import 'package:profile_student/app/modules/edit_profile/bindings/edit_profile_binding.dart';
import 'package:profile_student/app/modules/edit_profile/views/edit_profile_view.dart';
import 'package:profile_student/app/modules/home/bindings/home_binding.dart';
import 'package:profile_student/app/modules/home/views/home_view.dart';
import 'package:profile_student/app/modules/sertifikat/bindings/sertifikat_binding.dart';
import 'package:profile_student/app/modules/sertifikat/views/sertifikat_view.dart';
import 'package:profile_student/app/modules/voucher/bindings/voucher_binding.dart';
import 'package:profile_student/app/modules/voucher/views/voucher_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.DATA_DIRI,
      page: () => const DataDiriView(),
      binding: DataDiriBinding(),
    ),
    GetPage(
      name: _Paths.SERTIFIKAT,
      page: () => const SertifikatView(),
      binding: SertifikatBinding(),
    ),
    GetPage(
      name: _Paths.VOUCHER,
      page: () => const VoucherView(),
      binding: VoucherBinding(),
    ),
  ];
}

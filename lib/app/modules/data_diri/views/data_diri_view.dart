import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profile_student/app/modules/data_diri/components/data_diri_dropdown_item.dart';
import 'package:profile_student/app/modules/data_diri/components/data_diri_header.dart';
import 'package:profile_student/app/modules/data_diri/controllers/data_diri_controller.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/utils/app_asset.dart';
import 'package:profile_student/widgets/buttons/button_primary.dart';
import 'package:profile_student/widgets/inputs/input_date.dart';
import 'package:profile_student/widgets/inputs/input_dropdown.dart';
import 'package:profile_student/widgets/inputs/input_email.dart';
import 'package:profile_student/widgets/inputs/input_phone.dart';
import 'package:profile_student/widgets/inputs/input_primary.dart';

class DataDiriView extends GetView<DataDiriController> {
  const DataDiriView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(20.w),
            child: ButtonPrimary(
              onTap: () {},
              label: 'Verifikasi',
              radius: 8.w,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DataDiriHeader(),
              verticalSpace(28.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    InputPrimary(
                      label: 'Nama Depan',
                      hint: 'Masukkan Nama Depan',
                      controller: controller.cNamaDepan,
                      onChanged: (value) {},
                      validation: (value) => true,
                    ),
                    verticalSpace(Insets.sm),
                    InputPrimary(
                      label: 'Nama Belakang',
                      hint: 'Masukkan Nama Belakang',
                      controller: controller.cNamaBelakang,
                      onChanged: (value) {},
                      validation: (value) => true,
                    ),
                    verticalSpace(Insets.sm),
                    InputEmail(
                      label: 'Email',
                      hint: 'Masukkan Email',
                      controller: controller.cEmail,
                      value: (value) {},
                      validation: (value) => true,
                    ),
                    verticalSpace(Insets.sm),
                    InputDate(
                      label: 'Tanggal Lahir',
                      hint: 'Pilih Tanggal Lahir',
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: SizedBox.square(
                          dimension: 18.w,
                          child: Image.asset(AppAsset.icon('ic_date.png')),
                        ),
                      ),
                      controller: controller.cTanggalLahir,
                      value: (value) {},
                      validation: (value) => true,
                    ),
                    verticalSpace(Insets.sm),
                    InputPhone(
                      label: 'Nomor Telepon',
                      hint: 'Masukkan Nomor Telepon',
                      withCountryCode: true,
                      controller: controller.cNoTelepon,
                      validation: (value) => false,
                    ),
                    verticalSpace(Insets.xs),
                    InputDropdown(
                      title: 'Jenis Kelamin',
                      hintText: 'Pilih Jenis Kelamin',
                      items: [
                        ...controller.listJenisKelamin.map((item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: DataDiriDropdownItem(value: item),
                          );
                        })
                      ],
                      selectedItem: controller.selectedJenisKelamin.value,
                      onChanged: (value) {
                        if (value != null) {
                          final data = value as String;
                          controller.selectedJenisKelamin(data);
                        }
                      },
                    ),
                    verticalSpace(Insets.sm),
                    InputPrimary(
                      label: 'Peran',
                      hint: 'Masukkan Peran',
                      controller: controller.cPeran,
                      enable: false,
                      onChanged: (value) {},
                      validation: (value) => true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

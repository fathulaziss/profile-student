import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_student/app/modules/edit_profile/components/edit_profile_dropdown_item.dart';
import 'package:profile_student/app/modules/edit_profile/components/edit_profile_header.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/utils/app_asset.dart';
import 'package:profile_student/widgets/buttons/button_primary.dart';
import 'package:profile_student/widgets/inputs/input_date.dart';
import 'package:profile_student/widgets/inputs/input_dropdown.dart';
import 'package:profile_student/widgets/inputs/input_email.dart';
import 'package:profile_student/widgets/inputs/input_phone.dart';
import 'package:profile_student/widgets/inputs/input_primary.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final cNamaDepan = TextEditingController();
  final cNamaBelakang = TextEditingController();
  final cEmail = TextEditingController();
  final cTanggalLahir = TextEditingController();
  final cNoTelepon = TextEditingController();
  final cPeran = TextEditingController(text: 'Student');

  List<String> listJenisKelamin = ['Laki-Laki', 'Perempuan'];
  String selectedJenisKelamin = '';

  String photoProfileEdited = '';

  Future<void> changeProfile(ImageSource source) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: source);
    setState(() {
      photoProfileEdited = file!.path;
    });
  }

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
              label: 'Update',
              radius: 8.w,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              EditProfileHeader(
                onTapCamera: () {
                  changeProfile(ImageSource.camera);
                },
                onTapGallery: () {
                  changeProfile(ImageSource.gallery);
                },
                onTapRemove: () {
                  setState(() {
                    photoProfileEdited = '';
                  });
                },
                photoProfileEdited: photoProfileEdited,
              ),
              verticalSpace(28.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    InputPrimary(
                      label: 'Nama Depan',
                      hint: 'Masukkan Nama Depan',
                      controller: cNamaDepan,
                      onChanged: (value) {},
                      validation: (value) => true,
                    ),
                    verticalSpace(Insets.sm),
                    InputPrimary(
                      label: 'Nama Belakang',
                      hint: 'Masukkan Nama Belakang',
                      controller: cNamaBelakang,
                      onChanged: (value) {},
                      validation: (value) => true,
                    ),
                    verticalSpace(Insets.sm),
                    InputEmail(
                      label: 'Email',
                      hint: 'Masukkan Email',
                      controller: cEmail,
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
                      controller: cTanggalLahir,
                      value: (value) {},
                      validation: (value) => true,
                    ),
                    verticalSpace(Insets.sm),
                    InputPhone(
                      label: 'Nomor Telepon',
                      hint: 'Masukkan Nomor Telepon',
                      withCountryCode: true,
                      controller: cNoTelepon,
                      validation: (value) {
                        if (value.isNotEmpty && value.length != 15) {
                          return false;
                        } else {
                          return true;
                        }
                      },
                      validationText: 'Nomor telepon kamu belum diverifikasi',
                    ),
                    verticalSpace(Insets.xs),
                    InputDropdown(
                      title: 'Jenis Kelamin',
                      hintText: 'Pilih Jenis Kelamin',
                      items: [
                        ...listJenisKelamin.map((item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: EditProfileDropdownItem(
                              value: item,
                              isSelected: item == selectedJenisKelamin,
                            ),
                          );
                        })
                      ],
                      selectedItem: selectedJenisKelamin,
                      onChanged: (value) {
                        if (value != null) {
                          final data = value as String;
                          setState(() {
                            selectedJenisKelamin = data;
                          });
                        }
                      },
                    ),
                    verticalSpace(Insets.sm),
                    InputPrimary(
                      label: 'Peran',
                      hint: 'Masukkan Peran',
                      controller: cPeran,
                      onChanged: (value) {},
                      validation: (value) => true,
                      enable: false,
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

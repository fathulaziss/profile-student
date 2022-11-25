import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final cTanggalLahir = TextEditingController();
  final cNoTelepon = TextEditingController();

  List<String> listJenisKelamin = ['Laki-Laki', 'Perempuan'];
  RxString selectedJenisKelamin = ''.obs;

  RxString photoProfileEdited = ''.obs;

  Future<void> changeProfile(ImageSource source) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: source);
    photoProfileEdited(file!.path);
  }
}

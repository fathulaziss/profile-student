import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DataDiriController extends GetxController {
  final cNamaDepan = TextEditingController();
  final cNamaBelakang = TextEditingController();
  final cEmail = TextEditingController();
  final cTanggalLahir = TextEditingController();
  final cNoTelepon = TextEditingController();
  final cJenisKelamin = TextEditingController();
  final cPeran = TextEditingController(text: 'Student');

  List<String> listJenisKelamin = ['Laki-Laki', 'Perempuan'];
  RxString selectedJenisKelamin = ''.obs;

  RxString photoProfileEdited = ''.obs;

  Future<void> changeProfile(ImageSource source) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: source);
    photoProfileEdited(file!.path);
  }
}

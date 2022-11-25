import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DataDiriController extends GetxController {
  final cNamaDepan = TextEditingController(text: 'Muhammad');
  final cNamaBelakang = TextEditingController(text: 'Saitama');
  final cEmail = TextEditingController(text: 'Muhammadsaitama25@gmail.com');
  final cTanggalLahir = TextEditingController(text: '25/06/2001');
  final cNoTelepon = TextEditingController(text: '83156178892');
  final cJenisKelamin = TextEditingController(text: 'Laki-Laki');
  final cPeran = TextEditingController(text: 'Student');

  RxString photoProfileEdited = ''.obs;

  Future<void> changeProfile(ImageSource source) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: source);
    photoProfileEdited(file!.path);
  }
}

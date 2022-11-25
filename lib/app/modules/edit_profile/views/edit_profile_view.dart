import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_student/app/modules/edit_profile/controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditProfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child:
            Text('EditProfileView is working', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

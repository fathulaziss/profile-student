import 'package:get/get.dart';
import 'package:profile_student/app/modules/sertifikat/controllers/sertifikat_controller.dart';

class SertifikatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SertifikatController>(() => SertifikatController());
  }
}

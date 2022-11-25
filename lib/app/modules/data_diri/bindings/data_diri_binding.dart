import 'package:get/get.dart';
import 'package:profile_student/app/modules/data_diri/controllers/data_diri_controller.dart';

class DataDiriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataDiriController>(() => DataDiriController());
  }
}

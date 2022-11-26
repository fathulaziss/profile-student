import 'package:get/get.dart';
import 'package:profile_student/app/modules/voucher/controllers/voucher_controller.dart';

class VoucherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoucherController>(() => VoucherController());
  }
}

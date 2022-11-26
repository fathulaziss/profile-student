import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profile_student/app/modules/voucher/components/voucher_item.dart';
import 'package:profile_student/app/modules/voucher/components/voucher_tabbar.dart';
import 'package:profile_student/app/modules/voucher/controllers/voucher_controller.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/utils/app_asset.dart';
import 'package:profile_student/widgets/inputs/input_primary.dart';

class VoucherView extends GetView<VoucherController> {
  const VoucherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Voucher Kamu',
          style: TextStyles.title.copyWith(fontSize: 14.w),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.w,
          ),
        ),
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.all(20.w),
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pilih Voucher',
                style: TextStyles.title.copyWith(fontSize: 14.w),
              ),
              verticalSpace(20.w),
              const VoucherTabbar(),
              verticalSpace(20.w),
              InputPrimary(
                hint: 'Masukkan Kode',
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Icon(
                    Icons.search,
                    size: 24.w,
                    color: Colors.grey,
                  ),
                ),
                borderRadius: 25.w,
                color: const Color(0xFFF8F9FE),
                controller: controller.cSearchVoucher,
                onChanged: (value) {
                  controller.setSearch(value);
                },
                validation: (value) => true,
              ),
              verticalSpace(16.w),
              Row(
                children: [
                  Image.asset(AppAsset.icon('ic_voucher2.png'), width: 16.w),
                  horizontalSpace(16.w),
                  Text(
                    controller.tabbarIndex.value == 0
                        ? 'Kupon Instruktur'
                        : 'Kupon Lainnya',
                    style: TextStyles.title.copyWith(fontSize: 14.w),
                  )
                ],
              ),
              verticalSpace(12.w),
              Expanded(
                child: controller.search.value.isEmpty
                    ? ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controller.listVoucher.length,
                        itemBuilder: (context, index) {
                          return VoucherItem(
                            data: controller.listVoucher[index],
                          );
                        },
                      )
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controller.listSearchVoucher.length,
                        itemBuilder: (context, index) {
                          return VoucherItem(
                            data: controller.listSearchVoucher[index],
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_student/app/modules/voucher/models/voucher_model.dart';

class VoucherController extends GetxController {
  RxInt tabbarIndex = 0.obs;

  List<VoucherModel> listVoucher = <VoucherModel>[
    VoucherModel(
      expired: '8 jam lagi',
      image: 'img_voucher1.png',
      title: 'Diskon Pengguna Baru Rp 20K',
    ),
    VoucherModel(
      expired: '1 hari lagi',
      image: 'img_voucher2.png',
      title: 'Diskon 100% Max Rp.10K Min. Belanja Rp 200K',
    )
  ];

  final cSearchVoucher = TextEditingController();
  RxString search = ''.obs;
  RxList<VoucherModel> listSearchVoucher = <VoucherModel>[].obs;

  void setSearch(String value) {
    search(value);
    searchVoucher(keyword: search.value);
  }

  void searchVoucher({required String keyword}) {
    final searchList = <VoucherModel>[];
    for (var i = 0; i < listVoucher.length; i++) {
      final title = listVoucher[i].title;
      if (title.toLowerCase().contains(keyword.toLowerCase())) {
        searchList.add(listVoucher[i]);
      }
    }
    listSearchVoucher.value = searchList;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_student/app/modules/voucher/components/voucher_item.dart';
import 'package:profile_student/app/modules/voucher/components/voucher_tabbar.dart';
import 'package:profile_student/app/modules/voucher/models/voucher_model.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/utils/app_asset.dart';
import 'package:profile_student/widgets/inputs/input_primary.dart';

class VoucherView extends StatefulWidget {
  const VoucherView({super.key});

  @override
  State<VoucherView> createState() => _VoucherViewState();
}

class _VoucherViewState extends State<VoucherView> {
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

  int tabbarIndex = 0;

  final cSearchVoucher = TextEditingController();
  String search = '';
  List<VoucherModel> listSearchVoucher = <VoucherModel>[];

  void setSearch(String value) {
    setState(() {
      search = value;
      searchVoucher(keyword: search);
    });
  }

  void searchVoucher({required String keyword}) {
    final searchList = <VoucherModel>[];
    for (var i = 0; i < listVoucher.length; i++) {
      final title = listVoucher[i].title;
      if (title.toLowerCase().contains(keyword.toLowerCase())) {
        searchList.add(listVoucher[i]);
      }
    }
    setState(() {
      listSearchVoucher = searchList;
    });
  }

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
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.w,
          ),
        ),
      ),
      body: Padding(
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
            VoucherTabbar(
              onTapTabbar: (value) {
                setState(() {
                  tabbarIndex = value;
                });
              },
              tabbarIndex: tabbarIndex,
            ),
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
              controller: cSearchVoucher,
              onChanged: (value) => setSearch(value),
              validation: (value) => true,
            ),
            verticalSpace(16.w),
            Row(
              children: [
                Image.asset(AppAsset.icon('ic_voucher2.png'), width: 16.w),
                horizontalSpace(16.w),
                Text(
                  tabbarIndex == 0 ? 'Kupon Instruktur' : 'Kupon Lainnya',
                  style: TextStyles.title.copyWith(fontSize: 14.w),
                )
              ],
            ),
            verticalSpace(12.w),
            Expanded(
              child: search.isEmpty
                  ? ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: listVoucher.length,
                      itemBuilder: (context, index) {
                        return VoucherItem(data: listVoucher[index]);
                      },
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: listSearchVoucher.length,
                      itemBuilder: (context, index) {
                        return VoucherItem(data: listSearchVoucher[index]);
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}

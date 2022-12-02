import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_student/styles/colors.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/widgets/buttons/button_primary.dart';

class VoucherTabbar extends StatelessWidget {
  const VoucherTabbar({
    super.key,
    required this.onTapTabbar,
    required this.tabbarIndex,
  });

  final ValueSetter<int> onTapTabbar;
  final int tabbarIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Insets.sm),
      decoration: BoxDecoration(
        borderRadius: Corners.xxlBorder,
        color: const Color(0xFFF8F9FE),
      ),
      child: Row(
        children: [
          Expanded(
            child: ButtonPrimary(
              label: 'Kupon Instruktur',
              textStyle: TextStyles.title.copyWith(
                fontSize: 12.w,
                color:
                    tabbarIndex == 0 ? Colors.white : const Color(0xFFA5ADBB),
              ),
              color:
                  tabbarIndex == 0 ? AppColor.primaryColor : Colors.transparent,
              onTap: () {
                onTapTabbar(0);
              },
            ),
          ),
          Expanded(
            child: ButtonPrimary(
              label: 'Kupon Lainnya',
              textStyle: TextStyles.title.copyWith(
                fontSize: 12.w,
                color:
                    tabbarIndex == 1 ? Colors.white : const Color(0xFFA5ADBB),
              ),
              color:
                  tabbarIndex == 1 ? AppColor.primaryColor : Colors.transparent,
              onTap: () {
                onTapTabbar(1);
              },
            ),
          )
        ],
      ),
    );
  }
}

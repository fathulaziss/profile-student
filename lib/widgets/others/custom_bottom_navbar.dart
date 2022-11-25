import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profile_student/styles/colors.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/utils/app_asset.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);
  final int selectedIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 88.w,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ItemNavbar(
            isSelected: selectedIndex == 0,
            label: 'Home',
            assetIcon: AppAsset.icon('ic_home.png'),
            onTap: () => onTap(0),
          ),
          ItemNavbar(
            isSelected: selectedIndex == 1,
            label: 'Favorite',
            assetIcon: AppAsset.icon('ic_favorite.png'),
            onTap: () => onTap(1),
          ),
          ItemNavbar(
            isSelected: selectedIndex == 2,
            label: 'Forum',
            assetIcon: AppAsset.icon('ic_forum.png'),
            onTap: () => onTap(2),
          ),
          ItemNavbar(
            isSelected: selectedIndex == 3,
            label: 'Learnings',
            assetIcon: AppAsset.icon('ic_learning.png'),
            onTap: () => onTap(3),
          ),
          ItemNavbar(
            isSelected: selectedIndex == 4,
            label: 'Profile',
            assetIcon: AppAsset.icon('ic_profile.png'),
            onTap: () => onTap(4),
          ),
        ],
      ),
    );
  }
}

class ItemNavbar extends StatelessWidget {
  const ItemNavbar({
    Key? key,
    required this.isSelected,
    required this.label,
    this.assetIcon = '',
    this.onTap,
    this.icon,
  }) : super(key: key);

  final bool isSelected;
  final String label;
  final String assetIcon;
  final Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width / 5,
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xBFBFBFCF).withOpacity(0.4),
                    Colors.white,
                  ],
                )
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isSelected ? 24.w : 22.w,
              height: isSelected ? 24.w : 22.w,
              child: assetIcon.isNotEmpty
                  ? Image.asset(
                      assetIcon,
                      color: isSelected ? AppColor.primaryColor : Colors.grey,
                    )
                  : Icon(
                      icon,
                      color: isSelected ? AppColor.primaryColor : Colors.grey,
                      size: isSelected ? 24.w : 22.w,
                    ),
            ),
            verticalSpace(10.w),
            Text(
              label,
              style: TextStyles.text.copyWith(
                fontSize: 11.w,
                color: isSelected ? AppColor.primaryColor : Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}

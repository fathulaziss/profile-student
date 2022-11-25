import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_student/app/modules/home/controllers/home_controller.dart';
import 'package:profile_student/app/modules/home/tabs/tab_favorite.dart';
import 'package:profile_student/app/modules/home/tabs/tab_forum.dart';
import 'package:profile_student/app/modules/home/tabs/tab_home.dart';
import 'package:profile_student/app/modules/home/tabs/tab_learning.dart';
import 'package:profile_student/app/modules/home/tabs/tab_profile.dart';
import 'package:profile_student/widgets/others/custom_bottom_navbar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: controller.selectedPage.value,
          onTap: (index) {
            controller.navigation(index);
          },
        ),
        body: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            TabHome(),
            TabFavorite(),
            TabForum(),
            TabLearning(),
            TabProfile(),
          ],
        ),
      ),
    );
  }
}

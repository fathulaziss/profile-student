import 'package:flutter/material.dart';
import 'package:profile_student/app/modules/home/tabs/tab_favorite.dart';
import 'package:profile_student/app/modules/home/tabs/tab_forum.dart';
import 'package:profile_student/app/modules/home/tabs/tab_home.dart';
import 'package:profile_student/app/modules/home/tabs/tab_learning.dart';
import 'package:profile_student/app/modules/home/tabs/tab_profile.dart';
import 'package:profile_student/widgets/others/custom_bottom_navbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final pageController = PageController(initialPage: 4);
  int selectedPage = 4;

  void navigation(int index) {
    setState(() {
      selectedPage = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedPage,
        onTap: (index) => navigation(index),
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          TabHome(),
          TabFavorite(),
          TabForum(),
          TabLearning(),
          TabProfile(),
        ],
      ),
    );
  }
}

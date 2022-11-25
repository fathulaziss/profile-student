import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final pageController = PageController(initialPage: 4);
  RxInt selectedPage = 4.obs;

  void navigation(int index) {
    selectedPage(index);
    pageController.jumpToPage(index);
  }
}

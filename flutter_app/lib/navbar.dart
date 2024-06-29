
import 'package:flutter/material.dart';
import 'package:flutter_app/courses.dart';
import 'package:flutter_app/coursework.dart';
import 'package:flutter_app/detailcourse.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'homepage.dart';

class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: Colors.white,
            destinations: const [
              NavigationDestination(
                  icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Iconsax.book1), label: 'Courses'),
              NavigationDestination(
                  icon: Icon(Iconsax.user), label: 'Profile'),
            ],
          )),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    
    const HomePage(),
    const Courses(),
    const Detailcourse(),
  ];
}
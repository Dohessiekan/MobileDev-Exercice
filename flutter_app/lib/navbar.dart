import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'ProfilePage.dart';
import 'DetailCourse.dart';
import 'Courses.dart';
import 'homepage.dart';

// Main widget for the Bottom Navigation Menu
class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the NavigationController
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
            height: 80,  // Height of the bottom navigation bar
            elevation: 0,  // Shadow elevation of the bottom navigation bar
            selectedIndex: controller.selectedIndex.value,  // Get the currently selected index from the controller
            onDestinationSelected: (index) {
              controller.selectedIndex.value = index;
              // Update the selected index in the controller and navigate to the selected screen
              controller.pageController.jumpToPage(index);
            },
            backgroundColor: Colors.white,  // Background color of the bottom navigation bar
            destinations: const [
              NavigationDestination(
                  icon: Icon(Iconsax.home), label: 'Home'),  // Home destination with an icon and a label
              NavigationDestination(
                  icon: Icon(Iconsax.book1), label: 'Courses'),  // Courses destination with an icon and a label
              NavigationDestination(
                  icon: Icon(Iconsax.user), label: 'Profile'),  // Profile destination with an icon and a label
            ],
          )),
      // Display the screen based on the selected index
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.selectedIndex.value = index;
        },
        children: const [
          HomePage(),  // Home screen
          Courses(),  // Courses screen
          Profile(),  // Profile screen
        ],
      ),
    );
  }
}

// Controller for managing navigation
class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;  // Observable variable to keep track of the selected index
  final PageController pageController = PageController();  // Page controller for managing page views

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

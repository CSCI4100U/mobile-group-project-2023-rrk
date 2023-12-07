import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/setting/settings.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppScreenController());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          animationDuration: const Duration(seconds: 3),
          selectedIndex: controller.selectedMenu.value,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 255, 132, 0), // Set the background color to orange
          onDestinationSelected: (index) => controller.selectedMenu.value = index,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home, color: Colors.white), // Set icon color to white
              selectedIcon: Icon(Icons.home, color: Colors.red), // Set selected icon color to red
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.message, color: Colors.white), // Set icon color to white
              selectedIcon: Icon(Icons.message, color: Colors.red), // Set selected icon color to red
              label: 'Messages',
            ),
            NavigationDestination(
              icon: Icon(Icons.bookmark, color: Colors.white), // Set icon color to white
              selectedIcon: Icon(Icons.bookmark, color: Colors.red), // Set selected icon color to red
              label: 'Bookmarks',
            ),
            NavigationDestination(
              icon: Icon(Icons.help, color: Colors.white), // Set icon color to white
              selectedIcon: Icon(Icons.help, color: Colors.red), // Set selected icon color to red
              label: 'Help',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedMenu.value]),
    );
  }
}

class AppScreenController extends GetxController {
  static AppScreenController get instance => Get.find();

  final Rx<int> selectedMenu = 0.obs;

  final screens = [const SettingsScreen()];
}

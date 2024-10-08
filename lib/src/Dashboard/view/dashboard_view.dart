import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unified_alerts/src/Dashboard/controller/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Unified Alerts",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
                onTap: () {
                  // Handle profile tap action
                  Get.toNamed(
                      '/profile'); // For example, navigate to the profile page
                },
                child: const SizedBox(
                  width: 30, // Set the desired width
                  height: 30, // Set the desired height
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSH1UZso7zvlWYgZi-FXdpjfaaA7wdUwE37Gg&s',
                    ),
                  ),
                )),
          ),
        ],
      ),
      body: Obx(
        () => Center(
          // Display the widget corresponding to the selected tab
          child: controller.widgetOptions
              .elementAt(controller.selectedIndex.value),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: controller.selectedIndex.value, // Current selected index
        selectedItemColor:
            Theme.of(context).primaryColor, // Set the selected item color
        onTap: controller.onItemTapped, // Handle navigation on item tap
      ),
    );
  }
}

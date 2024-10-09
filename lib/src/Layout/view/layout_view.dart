import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unified_alerts/src/Layout/controller/layout_controller.dart';

class LayoutView extends GetView<LayoutController> {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          "Unified Alerts",
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: SizedBox(
              width: 30, // Set the desired width
              height: 30, // Set the desired height
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSH1UZso7zvlWYgZi-FXdpjfaaA7wdUwE37Gg&s',
                ),
              ),
            ),
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
            icon: Icon(Icons.notifications_active_rounded),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report_problem_rounded),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: controller.selectedIndex.value,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: controller.onItemTapped,
      ),
    );
  }
}

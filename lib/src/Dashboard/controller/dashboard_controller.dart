import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt selectedIndex = 0.obs;

  // List of pages for each tab
  List<Widget> widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 24)),
    Text('Search Page', style: TextStyle(fontSize: 24)),
    Text('Profile Page', style: TextStyle(fontSize: 24)),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unified_alerts/src/Dashboard/controller/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashbaord"),
      ),
      body: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [Text("Dashboard")],
        ),
      ),
    );
  }
}

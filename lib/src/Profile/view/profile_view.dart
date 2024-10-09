import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unified_alerts/src/Profile/controller/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text("Profile View"),
      ),
    );
  }
}

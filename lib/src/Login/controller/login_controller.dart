import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isPasswordHidden = true.obs;
  RxBool isLoading = false.obs;

  void login() {
    if (loginFormKey.currentState!.validate()) {
      isLoading.value = true;

      Future.delayed(const Duration(seconds: 2), () {
        isLoading.value = false;
        if (email.text == 'admin' && password.text == 'admin123') {
          Get.snackbar('Success', 'Login Successful');
          Get.offNamed('/home'); // Navigate to Home page
        } else {
          Get.snackbar('Error', 'Invalid credentials');
        }
      });
    }
  }

  void tagglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }
}

import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:unified_alerts/src/Services/api.dart';

class AccountRecoveryController extends GetxController {
  final GlobalKey<FormState> recoveryFormKey = GlobalKey<FormState>();

  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController email = TextEditingController();
  final List<TextEditingController> otpTextController =
      List.generate(6, (index) => TextEditingController());

  Timer? countdownTimer;
  RxInt remainingTime = 30.obs;

  RxBool isEmailVerified = true.obs;
  RxBool isOTPVerified = true.obs;

  void verifyEmail() async {
    isEmailVerified.value = true;
    startCountdown();
  }

  void validateOTP() async {
    var otp = otpTextController.map((controller) => controller.text).join('');

    try {
      final response = await Api.sendPost("validate-otp", {"otp": otp});

      if (response.statusCode == 200) {
        print('OTP validated successfully');
      } else {
        print('Failed to validate OTP: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void startCountdown() {
    remainingTime.value = 30;
    countdownTimer?.cancel();

    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void onClose() {
    countdownTimer?.cancel();
    super.onClose();
  }
}

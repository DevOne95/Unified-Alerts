import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unified_alerts/src/Account%20Recovery/Controller/account_recovery_controller.dart';
import 'package:unified_alerts/src/Component/footer.dart';

class AccountRecovery extends GetView<AccountRecoveryController> {
  const AccountRecovery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Recovery",
            style: TextStyle(color: Theme.of(context).colorScheme.primary)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      "EMAIL VERIFICATION",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                            "Verification of email is important for us to identify that you truly have an account in our system.",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 100),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                      child: Form(
                        key: controller.recoveryFormKey,
                        child: Obx(
                          () => Column(
                            children: [
                              // Display Email TextField if Email is not Verified
                              if (controller.isOTPVerified.value) ...[
                                TextFormField(
                                  controller: controller.newPassword,
                                  decoration: const InputDecoration(
                                    labelText: 'New Password',
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: controller.confirmPassword,
                                  decoration: const InputDecoration(
                                    labelText: 'Confirm Password',
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                              ],
                              // Display Email TextField if Email is not Verified
                              if (!controller.isEmailVerified.value &&
                                  !controller.isOTPVerified.value) ...[
                                TextFormField(
                                  controller: controller.email,
                                  decoration: const InputDecoration(
                                    labelText: 'Email address',
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 40),
                              ],
                              if (controller.isEmailVerified.value &&
                                  !controller.isOTPVerified.value) ...[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, bottom: 15, right: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("One Time Password",
                                          style: TextStyle(fontSize: 14)),
                                      Obx(() => Text(
                                            controller.remainingTime.value == 0
                                                ? ""
                                                : "Expire In : ${controller.remainingTime.value}s",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.red,
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 40),
                              ],
                              if (controller.isEmailVerified.value &&
                                  !controller.isOTPVerified.value) ...[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(6, (index) {
                                    return SizedBox(
                                      width: 50,
                                      child: TextField(
                                        controller:
                                            controller.otpTextController[index],
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        maxLength: 1,
                                        decoration: InputDecoration(
                                          counterText: '',
                                          enabledBorder:
                                              const OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          if (value.length == 1) {
                                            if (index < 5) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            } else {
                                              String otp = controller
                                                  .otpTextController
                                                  .map((controller) =>
                                                      controller.text)
                                                  .join('');
                                              print('Entered OTP: $otp');
                                            }
                                          } else if (value.isEmpty &&
                                              index > 0) {
                                            FocusScope.of(context)
                                                .previousFocus();
                                          }
                                        },
                                      ),
                                    );
                                  }),
                                ),
                                const SizedBox(height: 30),
                              ],
                              SizedBox(
                                width: double.infinity,
                                child: Obx(
                                  () => MaterialButton(
                                    onPressed: controller.isEmailVerified.value
                                        ? controller.validateOTP
                                        : controller.verifyEmail,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    child: Text(
                                        controller.isEmailVerified.isFalse
                                            ? "Submit"
                                            : controller.isOTPVerified.value
                                                ? "Save"
                                                : controller.remainingTime
                                                            .value !=
                                                        0
                                                    ? "Validate OTP"
                                                    : "Resend OTP",
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}

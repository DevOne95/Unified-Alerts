import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unified_alerts/src/Component/footer.dart';
import 'package:unified_alerts/src/Registration/controller/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});

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
                      "NOTICE",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                            "This account will be approve only if you have existing account on any service that ZCMC Provide. You will receive an email if your account is verified",
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
                        key: controller.registrationFormKey,
                        child: Column(
                          children: [
                            // Display Email TextField if Email is not Verified
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
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: controller.password,
                              obscureText: controller.isPasswordHidden.value,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: const OutlineInputBorder(),
                                  enabledBorder: const OutlineInputBorder(),
                                  suffixIcon: InkWell(
                                    onTap: controller.togglePassword,
                                    child: Obx(() => Icon(
                                          controller.isPasswordHidden.value
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.grey,
                                        )),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: controller.confirmPassword,
                              obscureText:
                                  controller.isConfirmPasswordHidden.value,
                              decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  border: const OutlineInputBorder(),
                                  enabledBorder: const OutlineInputBorder(),
                                  suffixIcon: InkWell(
                                    onTap: controller.toggleConfirmPassword,
                                    child: Obx(() => Icon(
                                          controller
                                                  .isConfirmPasswordHidden.value
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.grey,
                                        )),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 40),
                            SizedBox(
                              width: double.infinity,
                              child: MaterialButton(
                                onPressed: controller.submit,
                                color: Theme.of(context).colorScheme.primary,
                                child: const Text("Submit",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
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

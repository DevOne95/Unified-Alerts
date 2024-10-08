import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unified_alerts/src/Account%20Recovery/binding/account_recovery_binding.dart';
import 'package:unified_alerts/src/Account%20Recovery/view/account_recovery_view.dart';
import 'package:unified_alerts/src/Dashboard/binding/dashboard_binding.dart';
import 'package:unified_alerts/src/Dashboard/view/dashboard_view.dart';
import 'package:unified_alerts/src/Login/binding/login_binding_controller.dart';
import 'package:unified_alerts/src/Login/view/login_view.dart';
import 'package:unified_alerts/src/Registration/binding/registration_binding.dart';
import 'package:unified_alerts/src/Registration/view/registration_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Unified Alerts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(
            0xFF008088,
            {
              50: Color(0xFFE0F7F7),
              100: Color(0xFFB3ECEC),
              200: Color(0xFF80E0E0),
              300: Color(0xFF4DD3D3),
              400: Color(0xFF26C8C8),
              500: Color(0xFF00BCBC),
              600: Color(0xFF00B5B5),
              700: Color(0xFF00ABAB),
              800: Color(0xFF009E9E),
              900: Color(0xFF008888),
            },
          ),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => const LoginView(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/sign-up',
          page: () => const RegistrationView(),
          binding: RegistrationBinding(),
        ),
        GetPage(
          name: '/home',
          page: () => const DashboardView(),
          binding: DashboardBinding(),
        ),
        GetPage(
          name: '/forgot-password',
          page: () => const AccountRecovery(),
          binding: AccountRecoveryBinding(),
        ),
      ],
    );
  }
}

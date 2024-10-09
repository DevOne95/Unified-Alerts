import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unified_alerts/src/Account%20Recovery/binding/account_recovery_binding.dart';
import 'package:unified_alerts/src/Account%20Recovery/view/account_recovery_view.dart';
import 'package:unified_alerts/src/Layout/binding/layout_binding.dart';
import 'package:unified_alerts/src/Layout/view/layout_view.dart';
import 'package:unified_alerts/src/Login/binding/login_binding_controller.dart';
import 'package:unified_alerts/src/Login/view/login_view.dart';
import 'package:unified_alerts/src/Registration/binding/registration_binding.dart';
import 'package:unified_alerts/src/Registration/view/registration_view.dart';

const Color primaryColor = Color(0xFF76944C); // #76944C
const Color secondaryColor = Color(0xFFC8DAA6); // #C8DAA6
const Color backgroundColor = Colors.white;
const Color accentColor = Color(0xFFFFD21F); // #FFD21F
const Color neutralColor = Color(0xFFC0B6AC); // #C0B6AC
const Color errorColor = Colors.red;

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
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: primaryColor,
          onPrimary: Colors.white,
          secondary: accentColor,
          onSecondary: Colors.black87,
          tertiary: secondaryColor,
          error: errorColor,
          onError: Colors.white,
          surface: backgroundColor,
          onSurface: neutralColor,
          inverseSurface: Colors.black,
          onInverseSurface: Colors.white,
          outline: Colors.grey,
          shadow: Colors.black.withOpacity(0.2),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/layout',
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
          name: '/layout',
          page: () => const LayoutView(),
          binding: LayoutBinding(),
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

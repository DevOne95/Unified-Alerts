import 'dart:isolate';
import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:unified_alerts/src/Account%20Recovery/binding/account_recovery_binding.dart';
import 'package:unified_alerts/src/Account%20Recovery/view/account_recovery_view.dart';
import 'package:unified_alerts/src/Layout/binding/layout_binding.dart';
import 'package:unified_alerts/src/Layout/view/layout_view.dart';
import 'package:unified_alerts/src/Login/binding/login_binding_controller.dart';
import 'package:unified_alerts/src/Login/view/login_view.dart';
import 'package:unified_alerts/src/Notification/controller/awesome_notification_controller.dart';
import 'package:unified_alerts/src/Registration/binding/registration_binding.dart';
import 'package:unified_alerts/src/Registration/view/registration_view.dart';
import 'package:unified_alerts/src/Report/view/compose_view.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

const Color primaryColor = Color(0xFF76944C);
const Color secondaryColor = Color(0xFFC8DAA6);
const Color backgroundColor = Colors.white;
const Color accentColor = Color(0xFFFFD21F);
const Color neutralColor = Color(0xFFC0B6AC);
const Color errorColor = Colors.red;

Future<void> triggerNotification() async {
  if (await Permission.notification.request().isGranted) {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10, // Unique ID for the notification
        channelKey: 'alerts',
        title: 'Hello Awesome Notifications!',
        body: 'This is a sample notification triggered by a button!',
        notificationLayout: NotificationLayout.Default,
      ),
    );
  } else {
    print("Permission denied");
  }
}

void socketIsolate(SendPort sendPort) async {
  print("trigger isolate");

  // Initialize your socket connection here
  // Example: final socket = ... // create your socket connection

  // Simulate receiving a message after a delay
  Future.delayed(const Duration(seconds: 10), () {
    // Send a message back to the main isolate to trigger the notification
    sendPort.send("trigger_notification");
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AwesomeNotificationController.initializeLocalNotifications();
  await AwesomeNotificationController.initializeIsolateReceivePort();

  // Pass the root isolate token to ensure the background messenger is initialized
  RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
  BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

  // final receivePort = ReceivePort();
  // Start the isolate
  // await Isolate.spawn(socketIsolate, receivePort.sendPort);

  // receivePort.listen((message) async {
  //   print(message);
  //   if (message == "trigger_notification") {
  //     await triggerNotification(); // Call the notification function
  //   }
  // });

  // Start the background service

  await initializeService();

  runApp(const MyApp());
}

Future<void> initializeService() async {
  const notificationChannelId = 'my_foreground';
  const notificationId = 888;

  List<AndroidForegroundType> types = [AndroidForegroundType.dataSync];

  print("Foreground Service Type: ${types.toString()}");
  final service = FlutterBackgroundService();

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: backgroundServiceStart,
      autoStart: true,
      isForegroundMode: true,
      notificationChannelId: notificationChannelId,
      initialNotificationTitle: 'AWESOME SERVICE',
      initialNotificationContent: 'Initializing',
      foregroundServiceNotificationId: notificationId,
      foregroundServiceTypes: types,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: backgroundServiceStart,
      onBackground: onIosBackground,
    ),
  );
}

Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  return true;
}

void backgroundServiceStart(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await AwesomeNotificationController.initializeLocalNotifications();
    await AwesomeNotificationController.initializeIsolateReceivePort();
  } catch (error) {
    print("Error initializing notifications: $error");
  }

  if (service is AndroidServiceInstance) {
    if (await service.isForegroundService()) {
      print("App is running in foreground.");
    }
  } else {
    print("App is not running in foreground.");
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // The navigator key is necessary to navigate using static methods
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Color mainColor = const Color(0xFF9D50DD);

  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp> {
  @override
  void initState() {
    AwesomeNotificationController.startListeningNotificationEvents();
    super.initState();
  }

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
        GetPage(name: '/compose-report', page: () => const ComposeView()),
        GetPage(
          name: '/forgot-password',
          page: () => const AccountRecovery(),
          binding: AccountRecoveryBinding(),
        ),
      ],
    );
  }
}

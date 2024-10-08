import 'package:get/get.dart';
import 'package:unified_alerts/src/Registration/controller/registration_controller.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(() => RegistrationController());
  }
}

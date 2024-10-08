import 'package:get/get.dart';
import 'package:unified_alerts/src/Account%20Recovery/Controller/account_recovery_controller.dart';

class AccountRecoveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountRecoveryController>(() => AccountRecoveryController());
  }
}

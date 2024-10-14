import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unified_alerts/src/Account/controller/account_controller.dart';
import 'package:unified_alerts/src/Account/model/account_model.dart';
import 'package:unified_alerts/src/Account/view/account_detail_view.dart';

class AccountView extends GetView<AccountController> {
  final AccountModel? accountModel;

  const AccountView({super.key, this.accountModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black12,
        child: ListView.builder(
          itemCount: controller.accountList.length,
          itemBuilder: (context, index) {
            return AccountDetailView(
                accountModel: controller.accountList[index]);
          },
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unified_alerts/src/Account/model/account_model.dart';
import 'package:unified_alerts/src/Log%20History/view/log_history_view.dart';

class AccountFullView extends StatelessWidget {
  final AccountModel? accountModel;
  const AccountFullView({super.key, this.accountModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 520,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Account on ${accountModel!.systemName}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: _buildLogo(accountModel!.systemUrl),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text("Username: ${accountModel!.username}",
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 14)),
                  Text("Email: ${accountModel!.email}",
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 14)),
                  Text("System Name: ${accountModel!.systemName}",
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 14)),
                  const SizedBox(height: 20),
                  const Text("Login History",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 335,
            color: Colors.black12,
            child: ListView.builder(
                itemCount: accountModel!.loginHistory.length,
                itemBuilder: (context, int index) {
                  return LogHistoryView(
                      loginHistoryModel: accountModel!.loginHistory[index]);
                }),
          )
        ],
      ),
    );
  }

  Widget _buildLogo(String logoUrl) {
    bool isSvg = logoUrl.endsWith('.svg');

    return isSvg
        ? SvgPicture.network(
            logoUrl,
            fit: BoxFit.contain,
            placeholderBuilder: (context) => Container(
              padding: const EdgeInsets.all(10.0),
              child: const CircularProgressIndicator(),
            ),
          )
        : Image.network(
            logoUrl,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error),
          );
  }
}

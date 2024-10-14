import 'package:flutter/material.dart';
import 'package:unified_alerts/src/Account/model/account_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unified_alerts/src/Log%20History/view/log_history_view.dart';

class AccountDetailView extends StatelessWidget {
  final AccountModel? accountModel;

  const AccountDetailView({super.key, this.accountModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(accountModel!.systemName,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                  SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: _buildLogo(accountModel!.systemLogo),
                  ),
                ],
              ),
              Text("username: ${accountModel!.username}",
                  style: const TextStyle(fontSize: 12, color: Colors.black87)),
              Text("email: ${accountModel!.email}",
                  style: const TextStyle(fontSize: 12, color: Colors.black87)),
              const SizedBox(height: 10),
              LogHistoryView(loginHistoryModel: accountModel!.loginHistory[0])
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(String logoUrl) {
    // Check if the logo URL ends with .svg for SVG support
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

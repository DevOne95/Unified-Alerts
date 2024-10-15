import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unified_alerts/src/Log%20History/model/log_history_model.dart';

class LogHistoryView extends StatelessWidget {
  final LoginHistoryModel? loginHistoryModel;

  const LogHistoryView({super.key, this.loginHistoryModel});

  String formatDate(DateTime dateReported) {
    return DateFormat('MMM dd yyyy').format(dateReported);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(loginHistoryModel!.device,
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 13)),
                  Text(formatDate(loginHistoryModel!.loginDate),
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 13)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ip : ${loginHistoryModel!.ipAddress}",
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 13)),
                  Text("location : ${loginHistoryModel!.location}",
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 13)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 80,
                    height: 25,
                    child: MaterialButton(
                        color: Theme.of(context).colorScheme.primary,
                        onPressed: () {},
                        child: Text("Not Me",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 12))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

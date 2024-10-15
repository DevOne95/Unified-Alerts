import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unified_alerts/src/Leave/controller/leave_controller.dart';
import 'package:unified_alerts/src/Leave/view/leave_card_view.dart';

class LeaveView extends GetView<LeaveController> {
  const LeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 14.0, top: 5.0, right: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Current Leave Request",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontWeight: FontWeight.w700,
                        fontSize: 15)),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Remaining Leave ",
                style: TextStyle(
                  color: Colors.black87,
                )),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                child: Row(
                  children: [
                    const Text("Sick Leave:",
                        style: TextStyle(fontSize: 11, color: Colors.black54)),
                    const SizedBox(width: 5),
                    Text(
                        controller
                            .credit.value!.leaveCredits.remainingLeave.sickLeave
                            .toString(),
                        style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 13,
                            fontWeight: FontWeight.w700))
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    const Text("Vacation Leave:",
                        style: TextStyle(fontSize: 11, color: Colors.black54)),
                    const SizedBox(width: 5),
                    Text(
                        controller.credit.value!.leaveCredits.remainingLeave
                            .vacationLeave
                            .toString(),
                        style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 13,
                            fontWeight: FontWeight.w700))
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    const Text("Personal Leave:",
                        style: TextStyle(fontSize: 11, color: Colors.black54)),
                    const SizedBox(width: 5),
                    Text(
                        controller.credit.value!.leaveCredits.remainingLeave
                            .personalLeave
                            .toString(),
                        style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 13,
                            fontWeight: FontWeight.w700))
                  ],
                ),
              )
            ]),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 400,
              child: ListView.builder(
                itemCount: controller.leaves.length,
                itemBuilder: (context, index) {
                  return LeaveCardView(leaveModel: controller.leaves[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

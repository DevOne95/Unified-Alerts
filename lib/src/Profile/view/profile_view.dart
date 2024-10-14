import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unified_alerts/src/Calendar/view/calendar_view.dart';
import 'package:unified_alerts/src/Profile/controller/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black12,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(controller.user.url ??
                        "http://localhost:3000/api/profile.png"),
                    child: controller.user.url != null
                        ? null
                        : Text(controller.user.firstName[0].toUpperCase()),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "${controller.user.firstName} ${controller.user.lastName}",
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w700)),
                      Text(controller.user.email,
                          style: const TextStyle(
                              color: Colors.black87, fontSize: 12)),
                      Text(controller.user.contact ?? "",
                          style: const TextStyle(
                              color: Colors.black87, fontSize: 12))
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, top: 5.0, right: 15.0, bottom: 5.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Today's Logs",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 18)),
                      Text(DateFormat("MMMM d, y").format(DateTime.now()),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary))
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Time-in",
                              style: TextStyle(color: Colors.black54)),
                          Text("08:02 am",
                              style: TextStyle(color: Colors.black87))
                        ],
                      ),
                      Column(
                        children: [
                          Text("Break-out",
                              style: TextStyle(color: Colors.black54)),
                          Text("12:02 am",
                              style: TextStyle(color: Colors.black87))
                        ],
                      ),
                      Column(
                        children: [
                          Text("Time-in",
                              style: TextStyle(color: Colors.black54)),
                          Text("08:02 am",
                              style: TextStyle(color: Colors.black87))
                        ],
                      ),
                      Column(
                        children: [
                          Text("Break-out",
                              style: TextStyle(color: Colors.black54)),
                          Text("12:02 am",
                              style: TextStyle(color: Colors.black87))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          const CalendarView()
        ],
      ),
    );
  }
}

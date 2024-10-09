import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:unified_alerts/src/Notification/controller/notification_controller.dart';
import 'package:unified_alerts/src/Notification/view/notification_item_view.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: 35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.tabs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Obx(
                    () => TextButton(
                      onPressed: () {
                        controller.handleButtonPress(index);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: controller.selectedTab.value == index
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Text(
                        controller.tabs[index],
                        style: TextStyle(
                          color: controller.selectedTab.value == index
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
              flex: 4,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Obx(
                  () {
                    List<Map<Object, dynamic>> notifications =
                        controller.getFilteredNotifications();

                    return ListView.builder(
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          String sentIn =
                              timeago.format(notifications[index]['date']);

                          return NotificationItemView(
                            sentIn: sentIn,
                            systemLogo: notifications[index]['systemLogo'],
                            senderURL: notifications[index]['senderURL'],
                            senderInformation: notifications[index]
                                ['senderInformation'],
                            subject: notifications[index]['subject'],
                            message: notifications[index]['message'],
                            color: controller.getUrgencyColor(
                                notifications[index]['urgencyLevel']),
                            urgencyLevel: notifications[index]['urgencyLevel'],
                          );
                        });
                  },
                ),
              ))
        ],
      ),
    );
  }
}

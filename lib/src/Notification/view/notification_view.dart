import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:unified_alerts/src/Notification/controller/notification_controller.dart';
import 'package:unified_alerts/src/Notification/model/notication_model.dart';
import 'package:unified_alerts/src/Notification/view/notification_item_view.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black12,
      child: Column(
        children: [
          Container(
            height: 50,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
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
          ),
          Expanded(
              flex: 4,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Obx(
                  () {
                    List<NotificationModel> notifications =
                        controller.getFilteredNotifications();

                    return ListView.builder(
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          return NotificationItemView(
                            notificationModel: notifications[index],
                            color: controller.getUrgencyColor(
                                notifications[index].urgencyLevel),
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

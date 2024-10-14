// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:unified_alerts/src/Notification/model/notication_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationItemView extends StatelessWidget {
  final NotificationModel? notificationModel;
  final Color? color;

  const NotificationItemView({super.key, this.notificationModel, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notificationModel!.subject,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                      Row(children: [
                        Text(
                          timeago.format(notificationModel!.date),
                          style: const TextStyle(
                              color: Colors.black38, fontSize: 12),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                              color: color,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          notificationModel!.senderInformation,
                          style: const TextStyle(
                              color: Colors.black38, fontSize: 12),
                        ),
                      ])
                    ],
                  ),
                  if (notificationModel!.senderURL != null) ...[
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(notificationModel!.senderURL!),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    )
                  ],
                  if (notificationModel!.senderURL == null) ...[
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                      ),
                      child: ClipOval(
                        child: Image.network(
                          notificationModel!.systemLogo!,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Theme.of(context).colorScheme.secondary,
                              child:
                                  const Icon(Icons.error, color: Colors.white),
                            );
                          },
                        ),
                      ),
                    )
                  ]
                ],
              ),
              const SizedBox(height: 10),
              Text(
                notificationModel!.message,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 12),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

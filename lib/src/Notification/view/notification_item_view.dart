// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class NotificationItemView extends StatelessWidget {
  NotificationItemView(
      {super.key,
      this.sentIn,
      this.systemLogo,
      this.senderURL,
      this.senderInformation,
      this.color,
      this.subject,
      this.message,
      this.urgencyLevel});

  late String? subject;
  late String? sentIn;
  late Color? color;
  late String? senderInformation;
  late String? senderURL;
  late String? urgencyLevel;
  late String? systemLogo;
  late String? message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(subject!,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)),
                          Row(children: [
                            Text(
                              sentIn!,
                              style: const TextStyle(
                                  color: Colors.black38, fontSize: 12),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              senderInformation!,
                              style: const TextStyle(
                                  color: Colors.black38, fontSize: 12),
                            ),
                          ])
                        ],
                      ),
                      if (senderURL != null) ...[
                        CircleAvatar(
                          backgroundImage: NetworkImage(senderURL!),
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                        )
                      ],
                      if (senderURL == null) ...[
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                          ),
                          child: ClipOval(
                            child: Image.network(
                              systemLogo!,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  child: const Icon(Icons.error,
                                      color: Colors.white),
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
                    message!,
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
          const Divider()
        ],
      ),
    );
  }
}

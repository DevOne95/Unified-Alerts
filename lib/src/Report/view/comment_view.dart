import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentView extends StatelessWidget {
  final String senderURL;
  final String senderName;
  final String comment;
  final String date;

  const CommentView(
      {super.key,
      required this.senderURL,
      required this.senderName,
      required this.comment,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16.0,
            backgroundImage: NetworkImage(senderURL),
            onBackgroundImageError: (_, __) =>
                const AssetImage('assets/default_avatar.png'),
            child: Text(
              senderName[0].toUpperCase(),
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 5.0),
          Expanded(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFFE4E6EB),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 8.0, bottom: 8.0, right: 14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            senderName,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13.0,
                                color: Colors.black87),
                          ),
                          Text(
                            comment,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(timeago.format(DateTime.parse(date)),
                          style: const TextStyle(fontSize: 12))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

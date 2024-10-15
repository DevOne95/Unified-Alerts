import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unified_alerts/src/Leave/model/timeline_event_model.dart';

class TimelineView extends StatelessWidget {
  final List<TimelineEventModel> timeline;

  const TimelineView({super.key, required this.timeline});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: timeline.asMap().entries.map((entry) {
        int index = entry.key;
        var event = entry.value;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (index == 0) ...[const SizedBox(height: 7)],
                  if (index != 0) ...[
                    Container(
                      width: 2,
                      height: 7,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.3),
                    )
                  ],
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  if (index + 1 != timeline.length) ...[
                    Container(
                      width: 2,
                      height: 60,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.3),
                    )
                  ],
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat("MMMM d, y").format(event.date),
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${event.status}: ${event.description}",
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

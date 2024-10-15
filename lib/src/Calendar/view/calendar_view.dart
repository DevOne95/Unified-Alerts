import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unified_alerts/src/Calendar/controller/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Text("${DateFormat.EEEE().format(DateTime.now())} Schedule",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w800)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 8.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("8:00am-12:00pm/1:00pm-5:00pm",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                        fontSize: 14)),
                SizedBox(
                  width: 100,
                  height: 30,
                  child: MaterialButton(
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      _showBottomSheet(context, controller);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Set the border radius here
                    ),
                    child: const Text(
                      "SCHEDULE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, CalendarController controller) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      builder: (BuildContext context) {
        return SizedBox(
          width: double.infinity,
          height: 330,
          child: MonthView(
            controller: controller.eventController,
            showBorder: false,
            minMonth: DateTime(2012),
            maxMonth: DateTime(2050),
            initialMonth: DateTime.now(),
            cellAspectRatio: 1,
            onPageChange: (date, pageIndex) => print("$date, $pageIndex"),
            startDay: WeekDays.sunday,
            onEventTap: (event, date) => controller.selectedEvent.value = event,
            onEventDoubleTap: (events, date) => print(events),
            onEventLongTap: (event, date) => print(event),
            onDateLongPress: (date) => print(date),
            headerBuilder: MonthHeader.hidden,
            showWeekTileBorder: false,
            hideDaysNotInMonth: false,
          ),
        );
      },
    );
  }
}

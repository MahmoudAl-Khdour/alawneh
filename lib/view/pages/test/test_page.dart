// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

// import 'dart:collection';
//
// import 'package:alawneh/view/components/constants/app_color.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// class TableEventsExample extends StatefulWidget {
//   const TableEventsExample({super.key});
//
//   @override
//   _TableEventsExampleState createState() => _TableEventsExampleState();
// }
//
// class _TableEventsExampleState extends State<TableEventsExample> {
//   late final ValueNotifier<List<Event>> _selectedEvents;
//   CalendarFormat _calendarFormat = CalendarFormat.week;
//   RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
//       .toggledOff; // Can be toggled on/off by longpressing a date
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   DateTime? _rangeStart;
//   DateTime? _rangeEnd;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _selectedDay = _focusedDay;
//     _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
//   }
//
//   @override
//   void dispose() {
//     _selectedEvents.dispose();
//     super.dispose();
//   }
//
//   List<Event> _getEventsForDay(DateTime day) {
//     // Implementation example
//     return kEvents[day] ?? [];
//   }
//
//   List<Event> _getEventsForRange(DateTime start, DateTime end) {
//     // Implementation example
//     final days = daysInRange(start, end);
//
//     return [
//       for (final d in days) ..._getEventsForDay(d),
//     ];
//   }
//
//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     if (!isSameDay(_selectedDay, selectedDay)) {
//       setState(() {
//         _selectedDay = selectedDay;
//         _focusedDay = focusedDay;
//         _rangeStart = null; // Important to clean those
//         _rangeEnd = null;
//         _rangeSelectionMode = RangeSelectionMode.toggledOff;
//       });
//
//       _selectedEvents.value = _getEventsForDay(selectedDay);
//     }
//   }
//
//   void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
//     setState(() {
//       _selectedDay = null;
//       _focusedDay = focusedDay;
//       _rangeStart = start;
//       _rangeEnd = end;
//       _rangeSelectionMode = RangeSelectionMode.toggledOn;
//     });
//
//     // `start` or `end` could be null
//     if (start != null && end != null) {
//       _selectedEvents.value = _getEventsForRange(start, end);
//     } else if (start != null) {
//       _selectedEvents.value = _getEventsForDay(start);
//     } else if (end != null) {
//       _selectedEvents.value = _getEventsForDay(end);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TableCalendar - Events'),
//       ),
//       body: Column(
//         children: [
//           TableCalendar<Event>(
//             firstDay: kFirstDay,
//             lastDay: kLastDay,
//             focusedDay: _focusedDay,
//             selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//             rangeStartDay: _rangeStart,
//             rangeEndDay: _rangeEnd,
//             calendarFormat: _calendarFormat,
//             rangeSelectionMode: _rangeSelectionMode,
//             eventLoader: _getEventsForDay,
//             calendarBuilders: CalendarBuilders(
//               defaultBuilder: (context, day, focusedDay) => Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: AppColor.globalWhiteColor,
//                   ),
//                   child: Center(
//                     child: Text(
//                       '${day.day}',
//                       style: const TextStyle(
//                         color: AppColor.globalDefaultColor,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               todayBuilder: (context, day, focusedDay) => Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: AppColor.globalWhiteColor,
//                   ),
//                   child: Center(
//                     child: Text(
//                       '${day.day}',
//                       style: const TextStyle(
//                         color: AppColor.globalDefaultColor,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             startingDayOfWeek: StartingDayOfWeek.monday,
//             calendarStyle: CalendarStyle(
//               // Use `CalendarStyle` to customize the UI
//               outsideDaysVisible: false,
//               disabledTextStyle: const TextStyle(
//                 color: AppColor.globalButtonColor,
//               ),
//               rangeHighlightColor: AppColor.globalDefaultColor,
//
//               defaultTextStyle: const TextStyle(
//                 color: AppColor.globalDefaultColor,
//               ),
//               todayDecoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                 color: AppColor.globalDefaultColor,
//               ),
//
//               selectedDecoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(10),
//                 ),
//                 color: AppColor.globalDefaultColor,
//               ),
//               markerDecoration: BoxDecoration(
//                 color: Colors.blue[300]!,
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(100),
//                 ),
//               ),
//             ),
//             onDaySelected: _onDaySelected,
//             onRangeSelected: _onRangeSelected,
//             onFormatChanged: (format) {
//               if (_calendarFormat != format) {
//                 setState(() {
//                   _calendarFormat = format;
//                 });
//               }
//             },
//             onPageChanged: (focusedDay) {
//               _focusedDay = focusedDay;
//             },
//             pageAnimationEnabled: true,
//           ),
//           const SizedBox(height: 8.0),
//           Expanded(
//             child: ValueListenableBuilder<List<Event>>(
//               valueListenable: _selectedEvents,
//               builder: (context, value, _) {
//                 return ListView.builder(
//                   itemCount: value.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       height: 100,
//                       padding: const EdgeInsets.all(10),
//                       margin: const EdgeInsets.symmetric(
//                         horizontal: 10.0,
//                         vertical: 5.0,
//                       ),
//                       decoration: BoxDecoration(
//                         color: index % 2 == 0
//                             ? AppColor.globalEventContainerColor
//                             : AppColor.globalOddContainerColor,
//                         borderRadius: BorderRadius.circular(12.0),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.3),
//                             spreadRadius: 0.5,
//                             blurRadius: 7,
//                             offset: const Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Center(
//                         child: ListTile(
//                           onTap: () => print('${value[index]}'),
//                           title: Text('In ${index + 2} Am '),
//                           subtitle: Text(
//                               'Lorem Ipsum is simply Lorem Ipsum is simply Lorem Ipsum is simply'),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Copyright 2019 Aleksander Woźniak
// // SPDX-License-Identifier: Apache-2.0
//
// /// Example event class.
// class Event {
//   final String title;
//
//   const Event(this.title);
//
//   @override
//   String toString() => title;
// }
//
// /// Example events.
// ///
// /// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
// final kEvents = LinkedHashMap<DateTime, List<Event>>(
//   equals: isSameDay,
//   hashCode: getHashCode,
// )..addAll(_kEventSource);
//
// final _kEventSource = {
//   for (var item in List.generate(50, (index) => index))
//     DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5): List.generate(
//         item % 4 + 1, (index) => Event('Event $item | ${index + 1}'))
// }..addAll({
//     kToday: [
//       const Event(
//         'Today\'s Event 1',
//       ),
//       const Event('Today\'s Event 2'),
//       const Event('Today\'s Event 3'),
//       const Event('Today\'s Event 4'),
//       const Event('Today\'s Event 5'),
//       const Event('Today\'s Event 1'),
//       const Event('Today\'s Event 2'),
//       const Event('Today\'s Event 3'),
//       const Event('Today\'s Event 4'),
//       const Event('Today\'s Event 5'),
//     ],
//   });
//
// int getHashCode(DateTime key) {
//   return key.day * 1000000 + key.month * 10000 + key.year;
// }
//
// /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
// List<DateTime> daysInRange(DateTime first, DateTime last) {
//   final dayCount = last.difference(first).inDays + 1;
//   return List.generate(
//     dayCount,
//     (index) => DateTime.utc(first.year, first.month, first.day + index),
//   );
// }
//
// final kToday = DateTime.now();
// final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
// final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';

class ExamplePolls extends StatefulWidget {
  const ExamplePolls({Key? key}) : super(key: key);

  @override
  State<ExamplePolls> createState() => _ExamplePollsState();
}

class _ExamplePollsState extends State<ExamplePolls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Polls 🗳'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: polls().length,
          itemBuilder: (BuildContext context, int index) {
            final Map<String, dynamic> poll = polls()[index];

            final int days = DateTime(
              poll['end_date'].year,
              poll['end_date'].month,
              poll['end_date'].day,
            )
                .difference(DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                ))
                .inDays;

            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: FlutterPolls(
                pollId: poll['id'].toString(),
                // hasVoted: hasVoted.value,
                // userVotedOptionId: userVotedOptionId.value,
                onVoted: (PollOption pollOption, int newTotalVotes) async {
                  await Future.delayed(const Duration(seconds: 1));

                  /// If HTTP status is success, return true else false
                  return true;
                },
                pollEnded: days < 0,
                pollTitle: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    poll['question'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                pollOptions: List<PollOption>.from(
                  poll['options'].map(
                    (option) {
                      var a = PollOption(
                        id: option['id'],
                        title: Text(
                          option['title'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        votes: option['votes'],
                      );
                      return a;
                    },
                  ),
                ),
                votedPercentageTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                metaWidget: Row(
                  children: [
                    const SizedBox(width: 6),
                    const Text(
                      '•',
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      days < 0 ? "ended" : "ends $days days",
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

List polls() => [
      {
        'id': 1,
        'question':
            'Is Flutter the best framework for building cross-platform applications?',
        'end_date': DateTime(2023, 5, 21),
        'options': [
          {
            'id': 1,
            'title': 'Absolutely',
            'votes': 40,
          },
          {
            'id': 2,
            'title': 'Maybe',
            'votes': 20,
          },
          {
            'id': 3,
            'title': 'Meh!',
            'votes': 10,
          },
        ],
      }
    ];

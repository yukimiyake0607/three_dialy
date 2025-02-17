import 'package:flutter/material.dart';
import 'package:mindow/views/calender/widgets/table_calender.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DiaryCalender(),
        SizedBox(height: 10),
        Column(
          children: [
            Text('日記'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('日付'),
                Text('感情'),
              ],
            ),
            Text('日記1'),
            Text('日記2'),
            Text('日記3'),
          ],
        ),
      ],
    );
  }
}

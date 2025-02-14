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
        Text('ここに表示'),
      ],
    );
  }
}

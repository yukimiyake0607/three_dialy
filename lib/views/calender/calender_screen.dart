import 'package:flutter/material.dart';
import 'package:mindow/views/calender/widgets/diary_content.dart';
import 'package:mindow/views/calender/widgets/table_calender.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DiaryCalender(),
        SizedBox(height: 10),
        DiaryContent(),
      ],
    );
  }
}

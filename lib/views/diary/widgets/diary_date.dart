import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryDate extends StatefulWidget {
  const DiaryDate({super.key});

  @override
  State<DiaryDate> createState() => _DiaryDateState();
}

class _DiaryDateState extends State<DiaryDate> {
  late DateTime _selectedDate;
  final DateFormat _dateFormat = DateFormat('yyyy年MM月dd日', 'ja_JP');

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  void _changeDate(int days) {
    setState(() {
      _selectedDate = _selectedDate.add(Duration(days: days));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => _changeDate(-1),
            icon: const Icon(Icons.arrow_left),
          ),
          Text(
            _dateFormat.format(_selectedDate),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () => _changeDate(1),
            icon: const Icon(Icons.arrow_right),
          ),
        ],
      ),
    );
  }
}

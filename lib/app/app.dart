import 'package:flutter/material.dart';
import 'package:mindow/views/analysis/analysis_screen.dart';
import 'package:mindow/views/calender/calender_screen.dart';
import 'package:mindow/views/diary/diary_screen.dart';
import 'package:mindow/views/setting_option/setting_screen.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentPageNum = 0;
  List<Widget> listItem = [
    const DiaryScreen(),
    const CalenderScreen(),
    const AnalysisScreen(),
    const SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('mindow'),
          backgroundColor: Colors.orange,
        ),
        body: Center(
          child: listItem[_currentPageNum],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _currentPageNum = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.note_add_outlined), label: '日記'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined), label: 'カレンダー'),
            BottomNavigationBarItem(icon: Icon(Icons.analytics), label: '分析'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
          ],
          currentIndex: _currentPageNum,
          backgroundColor: Colors.green,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}

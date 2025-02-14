import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mindow/viewmodels/providers/diary_notifier.dart';

class DiaryScreen extends ConsumerStatefulWidget {
  const DiaryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends ConsumerState<DiaryScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  late DateTime _selectedDate;
  final DateFormat _dateFormat = DateFormat('yyyy年MM月dd日', 'ja_JP');

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  void _changeDate(int days) {
    setState(() {
      _selectedDate = _selectedDate.add(Duration(days: days));
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncDiaryList = ref.watch(diaryNotifierProvider);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text('実装可能か調査中'),
          const Text('昨日の出来事表示'),
          Padding(
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
          ),
          TextField(
            controller: _controller1,
          ),
          TextField(
            controller: _controller2,
          ),
          TextField(
            controller: _controller3,
          ),
          // ここにEmotion
          ElevatedButton(
            onPressed: () {
              final asyncDiaryListNotifier =
                  ref.read(diaryNotifierProvider.notifier);
              asyncDiaryListNotifier.addDiary(
                _controller1.text,
                _controller2.text,
                _controller3.text,
              );
              _controller1.clear();
              _controller2.clear();
              _controller3.clear();
            },
            child: const Text('追加'),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: asyncDiaryList.when(
              data: (data) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final diaryItem = data[index];
                    return ListTile(
                      subtitle: Column(
                        children: [
                          Text(diaryItem.textList[0]),
                          Text(diaryItem.textList[1]),
                          Text(diaryItem.textList[2]),
                        ],
                      ),
                    );
                  },
                );
              },
              error: (error, _) => const CircularProgressIndicator(),
              loading: () => const CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}

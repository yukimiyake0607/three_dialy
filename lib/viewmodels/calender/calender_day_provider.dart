import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calender_day_provider.g.dart';

@riverpod
class SelectedDay extends _$SelectedDay {
  @override
  DateTime? build() {
    return null;
  }

  void updateDay(DateTime selectedDay) {
    final normalizedDate = DateTime.utc(
      selectedDay.year,
      selectedDay.month,
      selectedDay.day,
    );
    state = normalizedDate;
  }
}

@riverpod
class FocusedDay extends _$FocusedDay {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void updateDay(DateTime focusedDay) {
    final normalizedDate = DateTime.utc(
      focusedDay.year,
      focusedDay.month,
      focusedDay.day,
    );

    state = normalizedDate;
  }
}

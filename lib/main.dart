import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mindow/app/app.dart';

void main() {
  initializeDateFormatting('ja_JP', null).then((_) => runApp(const MainApp()));
}

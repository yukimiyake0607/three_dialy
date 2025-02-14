import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mindow/app/app.dart';
import 'package:mindow/firebase_options.dart';

void main() async {
  // Flutter EngineとWidgetsの初期化
  WidgetsFlutterBinding.ensureInitialized();

  // Firebaseの初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 日本語の日付フォーマットの初期化
  await initializeDateFormatting('ja_JP', null);

  runApp(const ProviderScope(child: MainApp()));
}

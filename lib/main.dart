import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:investment_app/app.dart';
import 'package:investment_app/models/hive/profile_model.dart';
import 'package:easy_localization/easy_localization.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProfileModelAdapter());

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ru')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ru'),
      child: const App(),
    ),
  );
}

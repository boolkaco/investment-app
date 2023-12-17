import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:investment_app/app.dart';
import 'package:investment_app/models/hive/profile_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProfileModelAdapter());

  runApp(const App());
}

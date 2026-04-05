import 'package:flutter/material.dart';
import 'package:islam/core/shared_prefs/prefs.dart';
import 'package:islam/presentation/main_app/islami_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(const IslamApp());
}

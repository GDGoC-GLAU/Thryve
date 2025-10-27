import 'package:flutter/material.dart';
import 'services/water_reminder_service.dart';
import 'screens/water_reminder_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WaterReminderService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thryve App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: const WaterReminderScreen(),
    );
  }
}

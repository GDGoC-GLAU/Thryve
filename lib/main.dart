// import 'package:flutter/material.dart';
// import 'services/notification_service.dart';
// import 'utils/constants/export.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Thryve App',
//       debugShowCheckedModeBanner: false,
//       theme: AppTheme.lightTheme,
//       themeMode: ThemeMode.light,
//       home: AppStructure(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/data/latest_all.dart' as timezone;

import 'services/notification_service.dart';
import 'utils/constants/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize timezone (required for scheduled notifications)
  timezone.initializeTimeZones();

  // Initialize local notifications
  final notificationService = NotificationService();
  await notificationService.init();

  // Run app with Riverpod (in case you use state management)
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thryve App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      home: const AppStructure(),
    );
  }
}

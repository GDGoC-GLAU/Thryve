import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOSInit = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iOSInit,
    );

    await flutterLocalNotificationsPlugin.initialize(initSettings,
      // optional onSelectNotification callback
    );
  }

  Future<void> showRandomQuoteNow(List<String> quotes) async {
    final random = Random();
    final quote = quotes[random.nextInt(quotes.length)];

    const androidDetails = AndroidNotificationDetails(
      'thryve_quotes_channel',
      'Motivational Quotes',
      channelDescription: 'Daily motivational quotes from Thryve',
      importance: Importance.max,
      priority: Priority.high,
    );
    const platformDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      '✨ Motivation',
      quote,
      platformDetails,
    );
  }

  Future<void> scheduleDailyQuote({
    required int id,
    required TimeOfDay time,
    required List<String> quotes,
  }) async {
    final random = Random();
    final quote = quotes[random.nextInt(quotes.length)];

    final now = DateTime.now();
    final scheduledDate = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    final androidDetails = AndroidNotificationDetails(
      'thryve_quotes_channel',
      'Motivational Quotes',
      channelDescription: 'Daily motivational quotes from Thryve',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      '✨ Daily Motivation',
      quote,
      // convert scheduledDate to TZ-aware tz.TZDateTime (requires timezone package),
      tz.TZDateTime.from(scheduledDate, tz.local).add(Duration()),
      NotificationDetails(android: androidDetails),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.wallClockTime,
      matchDateTimeComponents: DateTimeComponents.time, // daily
    );
  }
}

import 'package:flutter/material.dart';
import '../services/water_reminder_service.dart';

class WaterReminderScreen extends StatefulWidget {
  const WaterReminderScreen({super.key});

  @override
  State<WaterReminderScreen> createState() => _WaterReminderScreenState();
}

class _WaterReminderScreenState extends State<WaterReminderScreen> {
  int selectedInterval = 2; // default every 2 hours

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Water Tracking Reminder"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const Text(
              "Remind me every:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            DropdownButton<int>(
              value: selectedInterval,
              items: [1, 2, 3, 4].map((hour) {
                return DropdownMenuItem(
                  value: hour,
                  child: Text("$hour Hours"),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedInterval = value!;
                });
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                WaterReminderService.scheduleWaterReminder(selectedInterval);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          "Water reminder set for every $selectedInterval hours")),
                );
              },
              child: const Text("Set Reminder"),
            ),
          ],
        ),
      ),
    );
  }
}

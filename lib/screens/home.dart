ElevatedButton(
  onPressed: () => NotificationService().showRandomQuoteNow(sampleQuotes),
  child: Text('Show one motivational quote now'),
),

ElevatedButton(
  onPressed: () {
    // schedule at 8:00 AM daily (example)
    NotificationService().scheduleDailyQuote(
      id: 100,
      time: TimeOfDay(hour: 8, minute: 0),
      quotes: sampleQuotes,
    );
  },
  child: Text('Schedule daily 8:00 AM motivational quote'),
),

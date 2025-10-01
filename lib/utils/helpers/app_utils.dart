
import 'package:intl/intl.dart';

abstract class AppUtils {

  static String capitalizeFirstLetter(String? text) {
    if (text == null || text.isEmpty) return "";
    return text.substring(0, 1).toUpperCase() + text.substring(1).toLowerCase();
  }
static String timeAgo(DateTime dateTime) {
  final now = DateTime.now();
  final diff = now.difference(dateTime);

  if (diff.inMinutes < 1) return 'Just now';
  if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
  if (diff.inHours < 24) return '${diff.inHours} hr ago';
  return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago';
}

  static String formatDate(DateTime? date) {
    if (date == null) return "";
    return DateFormat('dd-MM-yyyy hh:mm a').format(date);
  }

  static String formatTo12Hour(String timeString) {
    List<String> parts = timeString.split(':');
    if (parts.length != 3) return timeString; // Return original if not valid

    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    //int seconds = int.parse(parts[2]);

    String period = hours >= 12 ? "PM" : "AM";
    int hour12 = hours % 12 == 0 ? 12 : hours % 12; // Convert 0 to 12 for AM

    return "$hour12:${minutes.toString().padLeft(2, '0')} $period";
  }

  static String formatDateOnly(DateTime? date) {
    if (date == null) return "";
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static String? formatDateOnlyYMD(DateTime? date) {
    if (date == null) return null;
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static DateTime parseDateOnlyYMD(String? date) {
    if (date == null) return DateTime.now();
    return DateFormat('yyyy-MM-dd').parse(date);
  }

  static String formatDateText(DateTime? date) {
    if (date == null) return "";
    return DateFormat.yMMMd().format(date);
  }

  static String formatDay(DateTime? date) {
    if (date == null) return "";
    return DateFormat('EEEE').format(date);
  }

  /// ------------ phone helpers -----------------
  static bool isNumeric(String s) => s.isNotEmpty && int.tryParse(s.replaceAll("+", "")) != null;

  static String removeDiacritics(String str) {
    const withDia = 'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    const withoutDia = 'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    for (int i = 0; i < withDia.length; i++) {
      str = str.replaceAll(withDia[i], withoutDia[i]);
    }

    return str;
  }

  static String getTimeZone() => "${DateTime.now().timeZoneName}/${DateTime.now().timeZoneOffset}";
  
}

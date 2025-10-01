import 'package:flutter/material.dart';

import '../theme/app_colors.dart';


class AppPopups {
  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), backgroundColor: AppColors.darkGreen),
    );
  }
}

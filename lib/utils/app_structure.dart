import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thryve/screens/focus_screen.dart';
import 'package:thryve/screens/seat_selection_screen.dart';

import 'constants/export.dart';

class AppStructure extends StatefulWidget {
  const AppStructure({super.key});

  @override
  State<AppStructure> createState() => _AppStructureState();
}

class _AppStructureState extends State<AppStructure> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  List<Widget> screens = [
    Scaffold(
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(fontSize: 24, fontFamily: 'Gilroy'),
        ),
      ),
    ),
    FocusScreen(),
    SeatSelectionScreen(),
    Scaffold(
      body: Center(
        child: Text(
          'Accounts',
          style: TextStyle(fontSize: 24, fontFamily: 'Gilroy'),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _currentIndex,
      builder: (context, value, child) => Scaffold(
        body: IndexedStack(index: _currentIndex.value, children: screens),
        bottomNavigationBar: SafeArea(
          child: CustomNavigationBar(
            currentIndex: value,
            onTap: (index) => setState(() => _currentIndex.value = index),
            backgroundColor: AppColors.black,
            selectedColor: AppColors.lightGreen,
            unSelectedColor: AppColors.lightGreen,
            strokeColor: AppColors.lightGreen,

            items: [
              CustomNavigationBarItem(
                icon: Icon(
                  // _currentIndex.value == 0
                  //     ?
                  Icons.home,
                  // : Icons.home_outlined,
                ),
                title: Text(
                  'Home',
                  style: AppTextTheme.size12Normal.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: Icon(
                  // _currentIndex.value == 1
                  //     ? Icons.account_balance_wallet
                  //     :
                  Icons.explore,
                ),
                title: Text(
                  'Focus',
                  style: AppTextTheme.size12Normal.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text(
                  'Seats',
                  style: AppTextTheme.size12Normal.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: Icon(
                  // _currentIndex.value == 3
                  //     ? CupertinoIcons.person_crop_circle_fill
                  // :
                  CupertinoIcons.person_crop_circle,
                ),
                title: Text(
                  'Profile',
                  style: AppTextTheme.size12Normal.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

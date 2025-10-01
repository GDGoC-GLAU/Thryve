import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

    Scaffold(
      body: Center(
        child: Text(
          'Explore',
          style: TextStyle(fontSize: 24, fontFamily: 'Gilroy'),
        ),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text(
          'Favorite',
          style: TextStyle(fontSize: 24, fontFamily: 'Gilroy'),
        ),
      ),
    ),
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.darkGreen,
        statusBarColor: AppColors.darkGreen,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: ValueListenableBuilder(
        valueListenable: _currentIndex,
        builder:
            (context, value, child) => Scaffold(
              body: IndexedStack(index: _currentIndex.value, children: screens),
              bottomNavigationBar: CustomNavigationBar(
                currentIndex: value,
                onTap: (index) => setState(() => _currentIndex.value = index),
                backgroundColor: AppColors.darkGreen,
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
                    title: Text('Home', style: AppTextTheme.size12Normal),
                  ),
                  CustomNavigationBarItem(
                    icon: Icon(
                      // _currentIndex.value == 1
                      //     ? Icons.account_balance_wallet
                      //     :
                      Icons.explore,
                    ),
                    title: Text('Explore', style: AppTextTheme.size12Normal),
                  ),
                  CustomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    title: Text('Saved', style: AppTextTheme.size12Normal),
                  ),
                  CustomNavigationBarItem(
                    icon: Icon(
                      // _currentIndex.value == 3
                      //     ? CupertinoIcons.person_crop_circle_fill
                      // :
                      CupertinoIcons.person_crop_circle,
                    ),
                    title: Text('Profile', style: AppTextTheme.size12Normal),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}

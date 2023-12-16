import 'package:flutter/material.dart';
import 'package:investment_app/theme/app_colors.dart';

class BottomNavigationItem {
  static BottomNavigationBarItem createItem(
    IconData icon,
    String label,
    bool isSelected,
    BuildContext context,
  ) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: 60,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: <Widget>[
            Icon(icon),
            if (isSelected)
              Positioned(
                top: -10,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 2,
                    width: MediaQuery.of(context).size.width / 3,
                    color: AppColors.shamrock,
                  ),
                ),
              ),
          ],
        ),
      ),
      label: label,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:investment_app/screens/investment_screen.dart';
import 'package:investment_app/theme/app_colors.dart';
import 'package:investment_app/widgets/appbars/home_appbar.dart';
import 'package:investment_app/widgets/bottom_navigation/bottom_navigation_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    InvestmentScreen(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppbar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationItem.createItem(
            Icons.home,
            'Home',
            _selectedIndex == 0,
            context,
          ),
          BottomNavigationItem.createItem(
            Icons.favorite,
            'Favorite',
            _selectedIndex == 1,
            context,
          ),
          BottomNavigationItem.createItem(
            Icons.account_circle_rounded,
            'Profile',
            _selectedIndex == 2,
            context,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.shamrock,
        unselectedItemColor: AppColors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

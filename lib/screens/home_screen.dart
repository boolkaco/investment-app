import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_app/bloc/navigation/navigation_bloc.dart';
import 'package:investment_app/screens/favorite/favorite_screen.dart';
import 'package:investment_app/screens/investment/investment_screen.dart';
import 'package:investment_app/screens/profile/profile_screen.dart';
import 'package:investment_app/widgets/appbars/home_appbar.dart';
import 'package:investment_app/widgets/bottom_navigation/bottom_navigation_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  void _updateLanguage() {
    setState(() {});
  }

  void _onItemTapped(int index) {
    NavigationBloc navigationBloc = BlocProvider.of<NavigationBloc>(context);
    navigationBloc.updateIsNestedRoute(false);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const InvestmentScreen(),
      const FavoriteScreen(),
      ProfileScreen(
        callback: _updateLanguage,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(
        isProfile: _selectedIndex == 2,
        isFavorite: _selectedIndex == 1,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationItem.createItem(
            Icons.home,
            tr('home'),
            _selectedIndex == 0,
            context,
          ),
          BottomNavigationItem.createItem(
            Icons.favorite,
            tr('favorite'),
            _selectedIndex == 1,
            context,
          ),
          BottomNavigationItem.createItem(
            Icons.account_circle_rounded,
            tr('profile'),
            _selectedIndex == 2,
            context,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

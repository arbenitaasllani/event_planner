import 'package:event_planner/features/screens/favorite_screen.dart';
import 'package:event_planner/features/screens/message_screen.dart';
import 'package:event_planner/features/screens/my_ticket.dart';
import 'package:event_planner/features/screens/profile_screen.dart';
import 'package:event_planner/features/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:event_planner/features/screens/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  List<Widget> _children = [];

  @override
  void initState() {
    super.initState();
    _initializeChildren();
  }

  void _initializeChildren() {
    _children = [
      const HomeScreen(),
      const MyTicketScreen(),
      const FavoriteScreen(),
      const MessageScreen(),
      const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

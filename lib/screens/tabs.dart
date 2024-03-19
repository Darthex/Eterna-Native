import 'package:eterna_native/screens/chat_screen.dart';
import 'package:eterna_native/screens/new_home_screen.dart';
import 'package:eterna_native/screens/profile_screen.dart';
import 'package:flutter/material.dart';

final selectedScreen = {
  0: const NewHomeScreen(),
  1: const ChatScreen(),
  2: const ProfileScreen(),
};

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        toolbarHeight: double.minPositive + 10,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: selectedScreen[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
            activeIcon: Icon(Icons.chat_bubble),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}

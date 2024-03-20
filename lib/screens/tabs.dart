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
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
              size: 20,
            ),
            label: 'Home',
            activeIcon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.chat_bubble_rounded,
              size: 20,
            ),
            label: 'Chat',
            activeIcon: Icon(
              Icons.chat_bubble_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.person,
              size: 20,
            ),
            label: 'Profile',
            activeIcon: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

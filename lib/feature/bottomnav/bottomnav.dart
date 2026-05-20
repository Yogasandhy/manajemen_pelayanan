import 'package:flutter/material.dart';
import 'package:manajemen_pelayanan/feature/home/screen/homescreen.dart';
import 'package:manajemen_pelayanan/feature/home/screen/profilescreen.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  static const _titles = ['Dashboard', 'Profil'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[currentPageIndex],
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (selectedIndex) {
          setState(() {
            currentPageIndex = selectedIndex;
          });
        },
        indicatorColor: const Color(0xFFDCEBFF),
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.dashboard),
            icon: Icon(Icons.dashboard_outlined),
            label: 'Layanan',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: const [HomeScreen(), ProfileScreen()],
      ),
    );
  }
}

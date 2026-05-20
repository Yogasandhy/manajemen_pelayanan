import 'package:flutter/material.dart';
import 'package:manajemen_pelayanan/feature/home/screen/homescreen.dart';
import 'package:manajemen_pelayanan/feature/profile/profilescreen.dart';
import 'package:manajemen_pelayanan/l10n/app_localizations.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final titles = [l10n.dashboardTitle, l10n.profileTitle];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[currentPageIndex],
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
        destinations: [
          NavigationDestination(
            selectedIcon: const Icon(Icons.dashboard),
            icon: const Icon(Icons.dashboard_outlined),
            label: l10n.serviceNavLabel,
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.person),
            icon: const Icon(Icons.person_outline),
            label: l10n.profileNavLabel,
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

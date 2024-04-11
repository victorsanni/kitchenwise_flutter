import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class KitchenwiseNavBar extends StatelessWidget {
  const KitchenwiseNavBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  void _goOtherTab(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          _goOtherTab(index);
        },
        selectedIndex: navigationShell.currentIndex,
        elevation: 0.0,
        indicatorColor: Colors.transparent,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.inventory),
            label: 'inventory',
            selectedIcon: Icon(
              Icons.inventory,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          NavigationDestination(
            icon: const Icon(Icons.home),
            label: 'home',
            selectedIcon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          NavigationDestination(
            icon: const Icon(Icons.person),
            label: 'profile',
            selectedIcon: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}

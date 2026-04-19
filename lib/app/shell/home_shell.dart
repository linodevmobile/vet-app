import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vet_app/design_system/organisms/ds_bottom_bar.dart';

class HomeShell extends StatelessWidget {
  const HomeShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  static const _items = [
    DsBottomBarItem(icon: Icons.home_outlined, label: 'Hoy'),
    DsBottomBarItem(icon: Icons.pets, label: 'Pacientes'),
    DsBottomBarItem(icon: Icons.bed_outlined, label: 'Hospital'),
    DsBottomBarItem(icon: Icons.person_outline, label: 'Perfil'),
  ];

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      // Tap en tab ya activa vuelve al root del branch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: DsBottomBar(
        currentIndex: navigationShell.currentIndex,
        items: _items,
        onTap: _onTap,
      ),
    );
  }
}

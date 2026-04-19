import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class DsBottomBarItem {
  const DsBottomBarItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

class DsBottomBar extends StatelessWidget {
  const DsBottomBar({
    required this.currentIndex,
    required this.items,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final List<DsBottomBarItem> items;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DsSpacing.tabBarHeight,
      decoration: const BoxDecoration(
        color: DsColors.surface,
        border: Border(top: BorderSide(color: DsColors.lineSoft)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: List.generate(
            items.length,
            (i) => Expanded(
              child: _NavItem(
                item: items[i],
                selected: i == currentIndex,
                onTap: () => onTap(i),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final DsBottomBarItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOutCubic,
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: selected ? DsColors.primary : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              item.icon,
              size: 20,
              color: selected ? Colors.white : DsColors.ink40,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            item.label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: selected ? DsColors.primary : DsColors.ink60,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:portfolio/items/navItems.dart';
import 'package:portfolio/styles/color.dart';

class HeaderDesktop extends StatelessWidget implements PreferredSizeWidget {
  final Function(int) scrollToSection;
  final int selectedIndex;

  const HeaderDesktop({
    Key? key,
    required this.scrollToSection,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40), // Giảm height từ 20 xuống 10
          const Text(
            "Đinh Xuân Hoàng",
            style: TextStyle(
              color: Color.fromRGBO(75, 43, 43, 0.902),
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                NavItems.navItems.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextButton.icon(
                    onPressed: () => scrollToSection(index),
                    icon: Icon(
                      NavItems.navIcons[index],
                      color: selectedIndex == index
                          ? CustomColor.selected
                          : CustomColor.unselected,
                    ),
                    label: Text(
                      NavItems.navItems[index],
                      style: TextStyle(
                        color: selectedIndex == index
                            ? CustomColor.selected
                            : CustomColor.unselected,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

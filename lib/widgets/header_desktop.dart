import 'package:flutter/material.dart';
import 'package:portfolio/styles/color.dart';
import 'package:portfolio/items/navItems.dart';
import 'package:portfolio/styles/navStyle.dart';

// header desktop

class HeaderDesktop extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const HeaderDesktop(
      {Key? key, required this.screenWidth, required this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight / 9,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      // kGradientBoxDecoration
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Đinh Xuân Hoàng",
            style: TextStyle(
              color: CustomColor.fontMain,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              for (var i = 0; i < navItems.length; i++)
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            WidgetStateProperty.resolveWith<Color>((State) {
                          if (State.contains(WidgetState.pressed)) {
                            return CustomColor.navButtonBG;
                          } else {
                            return Colors.transparent;
                          }
                        }),
                      ),
                      onPressed: () {},
                      child: Text(navItems[i],
                          style: const TextStyle(
                            color: CustomColor.fontMain,
                            fontSize: 18,
                          )),
                    )),
            ],
          ),
        ],
      ),
    );
  }
}

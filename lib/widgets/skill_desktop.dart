import 'package:flutter/material.dart';
import 'package:portfolio/styles/color.dart';
import 'package:portfolio/widgets/buttonPlatform.dart';
import 'package:portfolio/items/skillItems.dart';

class SkillDesktop extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const SkillDesktop(
      {Key? key, required this.screenWidth, required this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        // Bỏ constraints cứng về height, chỉ để minHeight
        constraints: BoxConstraints(
          minHeight: screenHeight * 0.9,
        ),
        decoration: const BoxDecoration(
          color: CustomColor.skillBG,
        ),
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // Quan trọng: để Column chỉ chiếm không gian cần thiết
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Kỹ năng của mình",
                style: TextStyle(
                  color: CustomColor.tittle,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Đảm bảo Row bắt đầu từ trên xuống
              children: [
                Expanded(
                    flex: 1,
                    child: Wrap(
                      spacing: 30,
                      runSpacing: 20,
                      children: [
                        for (var item in skillItems)
                          Buttonplatform(
                              skillIcon: item['img'], skillName: item['title'])
                      ],
                    )),
                const Expanded(flex: 1, child: Column())
              ],
            )
          ],
        ));
  }
}

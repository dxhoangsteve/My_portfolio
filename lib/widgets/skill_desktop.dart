import 'package:flutter/material.dart';
import 'package:portfolio/styles/color.dart';
import 'package:portfolio/widgets/buttonPlatform.dart';
import 'package:portfolio/items/skillItems.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SkillDesktop extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const SkillDesktop(
      {Key? key, required this.screenWidth, required this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 50),
      constraints: BoxConstraints(
        minHeight: screenHeight * 0.9,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomColor.skillBG,
            CustomColor.skillBG.withOpacity(0.8),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Kỹ năng của tôi",
            style: TextStyle(
              color: CustomColor.tittle,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms, delay: 200.ms)
              .moveY(begin: -20, end: 0),
          const SizedBox(height: 50),

          // Skill Section Title
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                gradient: CustomColor.primaryGradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Ngôn ngữ & Công nghệ",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            )
                .animate()
                .fadeIn(duration: 600.ms, delay: 400.ms)
                .moveX(begin: -50, end: 0),
          ),
          // Skills Grid
          AnimationLimiter(
            child: Wrap(
              spacing: 30,
              runSpacing: 30,
              children: List.generate(
                skillItems.length,
                (index) => AnimationConfiguration.staggeredGrid(
                  position: index,
                  columnCount: 4,
                  duration: const Duration(milliseconds: 600),
                  delay: Duration(milliseconds: 100 * index),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: _buildSkillCard(
                        skillItems[index]['img'],
                        skillItems[index]['title'],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 50),

          // Platform Section Title
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                gradient: CustomColor.secondaryGradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Nền tảng & Công cụ",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            )
                .animate()
                .fadeIn(duration: 600.ms, delay: 700.ms)
                .moveX(begin: -50, end: 0),
          ),
          // Platforms Grid
          AnimationLimiter(
            child: Wrap(
              spacing: 30,
              runSpacing: 30,
              children: List.generate(
                platformItems.length,
                (index) => AnimationConfiguration.staggeredGrid(
                  position: index,
                  columnCount: 4,
                  duration: const Duration(milliseconds: 600),
                  delay: Duration(milliseconds: 100 * index + 300),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: _buildSkillCard(
                        platformItems[index]['img'],
                        platformItems[index]['title'],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(String image, String title) {
    return Container(
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          hoverColor: CustomColor.hoverColor,
          splashColor: CustomColor.primary.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  width: 45,
                  height: 45,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        color: CustomColor.tittle,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

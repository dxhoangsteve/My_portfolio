import 'package:flutter/material.dart';
import 'package:portfolio/styles/color.dart';
import 'package:portfolio/styles/size.dart';
import 'package:portfolio/widgets/aboutMe_desktop.dart';
import 'package:portfolio/widgets/header_desktop.dart';
import 'package:portfolio/widgets/project.dart';
import 'package:portfolio/widgets/skill_desktop.dart';
import '../widgets/nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  // Offsets for each section
  final double _skillsOffset = 600;
  final double _projectsOffset = 1200;
  final double _aboutOffset = 300;
  final double _contactOffset = 1800;

  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    final ScreenHeight = MediaQuery.of(context).size.height;
    return LayoutBuilder(builder: (context, constrains) {
      return Scaffold(
        // Removed unnecessary scaffold key
        backgroundColor: CustomColor.navBG,
        appBar: AppBar(
          title: HeaderDesktop(
            scrollToSection: (int) {}, selectedIndex: 32,
            // screenWidth: ScreenWidth,
            // screenHeight: ScreenHeight,
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            Nav(
              scrollController: _scrollController,
              skillsOffset: _skillsOffset,
              projectsOffset: _projectsOffset,
              aboutOffset: _aboutOffset,
              contactOffset: _contactOffset,
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    AboutmeDesktop(
                        screenWidth: ScreenWidth, screenHeight: ScreenHeight),
                    SkillDesktop(
                      screenWidth: ScreenWidth,
                      screenHeight: ScreenHeight,
                    ),
                    ProjectCard(
                      screenWidth: ScreenWidth,
                      screenHeight: ScreenHeight,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

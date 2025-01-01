import 'package:flutter/material.dart';
import 'package:portfolio/styles/color.dart';
import 'package:portfolio/styles/size.dart';
import 'package:portfolio/widgets/aboutMe_desktop.dart';
import 'package:portfolio/widgets/header_desktop.dart';
import 'package:portfolio/widgets/skill_desktop.dart';

// homepages
class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    final ScreenHeight = MediaQuery.of(context).size.height;
    return LayoutBuilder(builder: (context, constrains) {
      return Scaffold(
          key: _scaffoldKey,
          backgroundColor: CustomColor.navBG,
          // endDrawer:
          //     constrains.maxWidth < kMinDesktopMaxWidth ? null : const Drawer(),
          appBar: AppBar(
            title: HeaderDesktop(
              screenWidth: ScreenWidth,
              screenHeight: ScreenHeight,
            ),
            // backgroundColor: CustomColor.navBG,
            elevation: 0,
            // leading: IconButton(
            //   icon: const Icon(Icons.menu),
            //   onPressed: () {
            //     _scaffoldKey.currentState!.openEndDrawer();
            //   },
            // ),
          ),
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // if (constrains.maxWidth >= kMinDesktopMaxWidth)
                  //   HeaderDesktop(screenWidth: ScreenWidth, screenHeight: ScreenHeight,),
                  if (constrains.maxWidth >= kMinDesktopMaxWidth)
                    AboutmeDesktop(
                        screenWidth: ScreenWidth, screenHeight: ScreenHeight),
                  if (constrains.maxWidth >= kMinDesktopMaxWidth)
                    SkillDesktop(
                      screenWidth: ScreenWidth,
                      screenHeight: ScreenHeight,
                    ),
                ],
              )));
    });
  }
}

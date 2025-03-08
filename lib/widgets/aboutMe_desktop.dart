import 'package:flutter/material.dart';
import 'package:portfolio/items/navItems.dart';
import 'package:portfolio/styles/color.dart';
import 'dart:math' as math;
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:flutter_animate/flutter_animate.dart';

class AboutmeDesktop extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;

  const AboutmeDesktop(
      {Key? key, required this.screenWidth, required this.screenHeight})
      : super(key: key);

  @override
  State<AboutmeDesktop> createState() => _AboutmeDesktopState();
}

class _AboutmeDesktopState extends State<AboutmeDesktop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isHovered = false;
  int _roleIndex = 0;
  final List<String> _roles = [
    'Flutter Developer',
    'Mobile App Developer',
    'UI/UX Designer'
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    // Role changer timer
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _roleIndex = (_roleIndex + 1) % _roles.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomColor.aboutMeBG,
            CustomColor.aboutMeBG.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      height: widget.screenHeight * (0.9),
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Xin chào, tôi là ",
                          style: TextStyle(
                            color: CustomColor.subTittle,
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextSpan(
                          text: "Đinh Xuân Hoàng",
                          style: TextStyle(
                            color: CustomColor.primary,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(duration: 600.ms, delay: 300.ms).moveX(
                      begin: -30,
                      end: 0,
                      duration: 600.ms,
                      delay: 300.ms,
                      curve: Curves.easeOutQuad),
                  const SizedBox(height: 20),
                  Text(
                    _roles[_roleIndex],
                    style: const TextStyle(
                      color: CustomColor.tittle,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .then(delay: 2500.ms)
                      .fadeOut(),
                  const SizedBox(height: 30),
                  const Text(
                    "Chào mừng bạn đến với portfolio của mình",
                    style: TextStyle(
                      color: CustomColor.bodyText,
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ).animate().fadeIn(duration: 800.ms, delay: 500.ms).moveY(
                      begin: 20, end: 0, duration: 800.ms, delay: 500.ms),
                  const SizedBox(height: 50),
                  MouseRegion(
                    onEnter: (_) => setState(() => isHovered = true),
                    onExit: (_) => setState(() => isHovered = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      transform: isHovered
                          ? Matrix4.translationValues(5, -5, 0)
                          : Matrix4.identity(),
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        elevation: isHovered ? 8 : 4,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () async {
                            try {
                              await NavItems.downloadCV();
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Error downloading CV: $e')),
                              );
                            }
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: CustomColor.primaryGradient,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Tải CV",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.download_rounded,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ).animate().fadeIn(duration: 1000.ms, delay: 800.ms).moveY(
                      begin: 30,
                      end: 0,
                      duration: 800.ms,
                      delay: 600.ms,
                      curve: Curves.elasticOut),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      _buildSocialButton(
                          Icons.code, 'https://github.com/dxhoangsteve'),
                      _buildSocialButton(
                          Icons.mail, 'mailto:dinhxuanh09@gmail.com'),
                    ],
                  ).animate().fadeIn(duration: 1000.ms, delay: 1000.ms),
                ]),
          ),
          // Avatar animation
          Expanded(
            flex: 2,
            child: Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (_, child) {
                  return Transform.translate(
                    offset: Offset(
                      0,
                      10 * math.sin(_controller.value * 2 * math.pi),
                    ),
                    child: child,
                  );
                },
                child: Container(
                  height: 320,
                  width: 320,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: CustomColor.primary.withOpacity(0.3),
                        blurRadius: 30,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(160),
                    child: Image.asset(
                      'assets/images/avt.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ).animate().fadeIn(duration: 1200.ms, delay: 300.ms).scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1, 1),
                  duration: 1200.ms,
                  curve: Curves.easeOutQuad),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String url) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () async {
          try {
            await url_launcher.launchUrl(Uri.parse(url));
          } catch (e) {
            // Handle error
          }
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: CustomColor.primary,
            size: 24,
          ),
        ),
      ),
    );
  }
}

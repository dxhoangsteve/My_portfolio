import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class Nav extends StatelessWidget {
  final ScrollController scrollController;
  final double skillsOffset;
  final double projectsOffset;
  final double aboutOffset;
  final double contactOffset;

  const Nav({
    Key? key,
    required this.scrollController,
    required this.skillsOffset,
    required this.projectsOffset,
    required this.aboutOffset,
    required this.contactOffset,
  }) : super(key: key);

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launcher.launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  void _scrollToSection(double offset) {
    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => _scrollToSection(aboutOffset),
            child: const Text('About'),
          ),
          TextButton(
            onPressed: () => _scrollToSection(skillsOffset),
            child: const Text('Skills'),
          ),
          TextButton(
            onPressed: () => _scrollToSection(projectsOffset),
            child: const Text('Projects'),
          ),
          TextButton(
            onPressed: () => _scrollToSection(contactOffset),
            child: const Text('Contact'),
          ),
          ElevatedButton(
            onPressed: () {
              _launchURL(
                  "/assets/files/InternMobileDeveloper_PhamAnhTuan_Standard.pdf");
            },
            child: const Text('Download CV'),
          ),
        ],
      ),
    );
  }
}

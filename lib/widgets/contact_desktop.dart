import 'package:flutter/material.dart';
import 'package:portfolio/styles/color.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDesktop extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const ContactDesktop({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: screenHeight * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Contact Information",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: CustomColor.tittle,
            ),
          ),
          const SizedBox(height: 40),
          _buildContactItem(Icons.person, "Đinh Xuân Hoàng"),
          _buildContactItem(Icons.phone, "0239474859"),
          _buildContactItem(Icons.email, "dinhxuanh09@gmail.com"),
          _buildContactItem(Icons.location_on, "Quận 7, TP.HCM"),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: CustomColor.fontMain),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              color: CustomColor.fontMain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(String label, String url, String iconPath) {
    return ElevatedButton.icon(
      onPressed: () => _launchURL(url),
      icon: Image.asset(iconPath, height: 24, width: 24),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColor.aboutMeBtn,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

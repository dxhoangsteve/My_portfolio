import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/styles/color.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContactDesktop extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const ContactDesktop({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  // Cập nhật phương thức này để sử dụng API mới của url_launcher
  void _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  // Phương thức mới để mở ứng dụng email
  void _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{
        'subject': 'Contact from Portfolio Website',
      }),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  // Hàm hỗ trợ mã hóa tham số truy vấn
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  // Phương thức mới để sao chép vào clipboard
  void _copyToClipboard(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Đã sao chép: $text'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Phương thức mới để mở Google Maps
  void _openMap(String address) async {
    final Uri mapUri = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}');

    if (await canLaunchUrl(mapUri)) {
      await launchUrl(mapUri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomColor.contactBG,
            CustomColor.contactBG.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      height: screenHeight * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Thông tin liên hệ",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: CustomColor.tittle,
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms, delay: 200.ms)
              .moveY(begin: -20, end: 0),
          const SizedBox(height: 50),
          _buildContactItem(Icons.person, "Đinh Xuân Hoàng", onTap: null),
          _buildContactItem(
            Icons.phone,
            "0337 446 990",
            onTap: () => _copyToClipboard("0337446990", context),
          ),
          _buildContactItem(
            Icons.email,
            "dinhxuanh09@gmail.com",
            onTap: () => _launchEmail("dinhxuanh09@gmail.com"),
          ),
          _buildContactItem(
            Icons.location_on,
            "1137/3, đường Huỳnh Tấn Phát, phường Phú Thuận, Quận 7, TP.HCM",
            onTap: () => _openMap(
                "1137/3, đường Huỳnh Tấn Phát, phường Phú Thuận, Quận 7, TP.HCM"),
          ),
        ],
      ),
    );
  }

  // Cập nhật widget này để thêm InkWell và xử lý sự kiện onTap
  Widget _buildContactItem(IconData icon, String text, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: CustomColor.bodyText),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                color: CustomColor.bodyText,
              ),
            ),
            if (onTap != null) ...[
              const SizedBox(width: 8),
              const Icon(
                Icons.touch_app,
                size: 16,
                color: Colors.blue,
              ),
            ],
          ],
        ),
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

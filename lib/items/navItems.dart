import 'package:flutter/material.dart';
import 'dart:html' as html;

class NavItems {
  static List<String> navItems = [
    'About Me',
    'Skills',
    'Projects',
    'Experience',
    'Contact',
  ];

  static List<IconData> navIcons = [
    Icons.person,
    Icons.handyman_outlined,
    Icons.apps_outlined,
    Icons.work,
    Icons.quick_contacts_mail,
  ];

  static Future<void> downloadCV() async {
    try {
      const pdfPath =
          'assets/files/InternMobileDeveloper_PhamAnhTuan_Standard.pdf';

      // Create anchor element with direct path
      final anchor = html.AnchorElement(href: pdfPath)
        ..setAttribute('download', 'PhamAnhTuan_CV.pdf')
        ..style.display = 'none';

      html.document.body?.children.add(anchor);
      anchor.click();
      html.document.body?.children.remove(anchor);
    } catch (e) {
      print('Error downloading CV: $e');
      rethrow;
    }
  }
}

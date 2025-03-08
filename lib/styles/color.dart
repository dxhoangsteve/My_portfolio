import 'dart:ui';
import 'package:flutter/material.dart';

class CustomColor {
  // Bảng màu chính
  static const Color primary = Color(0xFF6200EE);
  static const Color primaryVariant = Color(0xFF3700B3);
  static const Color secondary = Color(0xFF03DAC6);
  static const Color secondaryVariant = Color(0xFF018786);
  static const Color accent = Color(0xFFFF4081);

  // Màu nền
  static const Color navBG = Color(0xFFF5F7FA);
  static const Color aboutMeBG = Color(0xFFF0F7FF);
  static const Color skillBG = Color(0xFFFFF0F7);
  static const Color projectBG = Color(0xFFF0FFFC);
  static const Color contactBG = Color(0xFFFFF8F0);

  // Màu gradient
  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient secondaryGradient = LinearGradient(
    colors: [Color(0xFF00CDAC), Color(0xFF02AAB0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient accentGradient = LinearGradient(
    colors: [Color(0xFFFA8BFF), Color(0xFF2BD2FF), Color(0xFF2BFF88)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Màu text
  static const Color tittle = Color(0xFF212121);
  static const Color subTittle = Color(0xFF757575);
  static const Color bodyText = Color(0xFF616161);
  static const Color lightText = Color(0xFFEEEEEE);

  // Màu nút và tương tác
  static const Color buttonPrimary = Color(0xFF6200EE);
  static const Color buttonSecondary = Color(0xFF03DAC6);
  static const Color aboutMeBtn = Color(0xFF6200EE);
  static const Color hoverColor = Color(0xFFE0E0FF);
  static const Color cardShadow = Color(0x1A000000);

  // Màu cho navigation
  static const Color selected = Color(0xFF6200EE);
  static const Color selectedIndex = Color(0xFF3700B3);
  static const Color unselected = Color(0xFF757575);

  // Màu cho skill
  static const Color skillBtn = Colors.white;

  // Màu cho project
  static const Color projectLink = Color(0xFF6200EE);
}

import 'package:flutter/material.dart';
import 'package:portfolio/styles/color.dart';

BoxDecoration kGradientBoxDecoration = const BoxDecoration(
  gradient: LinearGradient(
    colors: [CustomColor.navBgStart, CustomColor.navBgEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);

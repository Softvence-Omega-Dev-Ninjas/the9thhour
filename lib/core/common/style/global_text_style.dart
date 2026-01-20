import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalTextStyle {
  GlobalTextStyle._();

  static TextStyle heading1 = GoogleFonts.playfairDisplay(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    color: Colors.black,
  );
  static TextStyle heading2 = GoogleFonts.playfairDisplay(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: Colors.black,
  );

  static TextStyle bodyText = GoogleFonts.playfairDisplay(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: Color(0xFF040404),
  );

  static TextStyle caption = GoogleFonts.playfairDisplay(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );
}

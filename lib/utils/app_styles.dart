import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle get titleStyle {
    return GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle get bodyStyle {
    return GoogleFonts.poppins(
      fontSize: 16,
    );
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget CustomHolder(String text, String img) {
  return Column(
    children: [
      Image.asset(img),
      Text(text,
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ))
    ],
  );
}

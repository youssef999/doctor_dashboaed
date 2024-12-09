// ignore_for_file: must_be_immutable

import 'package:doctor/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormFieldV2 extends StatefulWidget {
  String label;
  IconData icon;
  TextInputType type;
  IconData? suffix;
  String validateMessage;
  String? hint;
  final Color? color;
  Function(String?)? onChanged;
  TextEditingController controller;
  CustomTextFormFieldV2({
    super.key,
    required this.label,
    this.onChanged,
    this.suffix,
    this.hint,
    this.validateMessage = '',
    this.icon = Icons.person,
    this.type = TextInputType.text,
    this.color,
    required this.controller,
  });

  @override
  State<CustomTextFormFieldV2> createState() => _CustomTextFormFieldV2State();
}

class _CustomTextFormFieldV2State extends State<CustomTextFormFieldV2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 5.0, right: 8, left: 8, top: 10),
        child: TextFormField(
          controller: widget.controller,
          textAlign: TextAlign.right, // Align text to the right
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            labelText: widget.label, // Label text in Arabic
            labelStyle: GoogleFonts.cairo(),
            suffixIcon: widget.suffix != null ? Icon(widget.suffix) : null,
            floatingLabelBehavior: FloatingLabelBehavior
                .always, // Always show the label at the top
            alignLabelWithHint: true,
            hintText: widget.hint,
      
            hintStyle: GoogleFonts.cairo(
                fontSize: 12,
                color: AppColors.greyColor.withOpacity(.3),
                fontWeight: FontWeight.w600),
            // Align the label with the hint text
            contentPadding:
                const EdgeInsets.only( right: 15.0,left: 15),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.greyColor.withOpacity(.1), width: 4),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.greyColor.withOpacity(.2), width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.greyColor.withOpacity(.2), width: 1.5),
            ),
          ),
        ));
  }
}

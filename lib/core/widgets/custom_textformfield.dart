// ignore_for_file: must_be_immutable

import 'package:doctor/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  String label;
  bool obs;
  IconData icon;
  String hint;
  TextInputType type;
  String validateMessage;
  final Color? color;
  Color? fontColor;
  Function(String?)? onChanged;
  int? max;
  double? fontSize;
  TextEditingController controller;
  CustomTextFormField({
    super.key,
    required this.label,
    this.max = 2,
    this.onChanged,
    this.fontColor,
    this.fontSize,
    this.hint = '',
    this.validateMessage = '',
    this.icon = Icons.person,
    this.type = TextInputType.text,
    required this.obs,
    this.color,
    required this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8, top: 15),
        child: TextFormField(
          onChanged: widget.onChanged,
          textAlign: TextAlign.right, // Align text to the right
          obscureText: widget.obs,
          validator: (value) {
            return value!.length < 3 ? widget.validateMessage : null;
          },
          decoration: InputDecoration(
            labelText: widget.label, // Label text in Arabic
            labelStyle: GoogleFonts.cairo(),
            hintText: widget.hint,
            hintStyle: GoogleFonts.cairo(
                fontSize: widget.fontSize ?? 15, color: widget.fontColor),
            suffixIcon: widget.label == 'password'.tr
                ? IconButton(
                    icon: Icon(
                      widget.obs
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.obs = !widget.obs;
                      });
                    })
                : null,

            floatingLabelBehavior: FloatingLabelBehavior
                .always, // Always show the label at the top
            alignLabelWithHint: true, // Align the label with the hint text
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            border: const OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkColor),
            ),
          ),
        ));
  }
}

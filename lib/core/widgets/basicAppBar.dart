// ignore_for_file: non_constant_identifier_names

import 'package:doctor/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget BasicAppBar(
    String text,) {

  return AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 50,
        leading: const SizedBox(),
        title: Padding(
          padding: const EdgeInsets.all(24 * 1.2),
          child: Text(
            text,
            style: GoogleFonts.cairo(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: AppColors.darkColor,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.darkColor,
              )),
        ],
      );
}

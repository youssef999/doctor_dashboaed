// ignore_for_file: non_constant_identifier_names

import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/features/root/controller/root_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget CustomAppBar(
    String text, BuildContext context, bool isHome) {
  final bottomNavBarController = Get.put(RootController(), permanent: false);

  return AppBar(
    backgroundColor: AppColors.primaryBGLightColor,
    elevation: 0,
    centerTitle: true,
  toolbarHeight: 80,
    title: Padding(
      padding: const EdgeInsets.all(24 * 1.2),
      child: Text(
        text,
        style: GoogleFonts.cairo(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: AppColors.whiteColor,
        ),
      ),
    ),
    // actions: [
    //   isHome
    //       ? Row(
    //
    //           children: [
    //             IconButton(
    //               onPressed: () {
    //                 Get.toNamed(Routes.PROFILE);
    //               },
    //               icon: const Icon(
    //                 Icons.share_outlined,
    //                 color: AppColors.whiteColor,
    //               ),
    //             ),
    //             IconButton(
    //                 onPressed: () {},
    //                 icon: const Icon(
    //                   Icons.bookmark_border,
    //                   color: AppColors.whiteColor,
    //                 ))
    //           ],
    //         )
    //       : const SizedBox()
    // ],
  );
}

// ignore_for_file: deprecated_member_use

import 'package:doctor/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

buildBottomNavigationMenu(context, bottomNavBarController, String roleid) {
  return Obx(() {
    return BottomAppBar(
      elevation: 0,
      color: AppColors.whiteColor,
      height: 70,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10 * 3.22)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            bottomItemWidget(
              'assets/icon/home.svg',
              bottomNavBarController,
              0,
              AppColors.transparent,
              'الرئيسيه',
              24,
            ),
            bottomItemWidget(
              'assets/icon/calender.svg',
              bottomNavBarController,
              1,
              AppColors.transparent,
              'الحجوزات',
              28,
            ),
            bottomItemWidget(
              'assets/icon/chat.svg',
              bottomNavBarController,
              2,
              AppColors.transparent,
              'الدردشه',
              24,
            ),
            bottomItemWidget(
              'assets/icon/more.svg',
              bottomNavBarController,
              3,
              AppColors.transparent,
              'المزيد',
              28,
            ),
          ],
        ),
      ),
    );
  });
}

bottomItemWidget(String icon, bottomNavBarController, page, Color color,
    String name, double start) {
  return Expanded(
    child: GestureDetector(
        onTap: () {
          bottomNavBarController.selectedIndex.value = page;
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              color: bottomNavBarController.selectedIndex.value == page
                  ? AppColors.darkColor
                  : AppColors.darkColor.withOpacity(0.4),
              height: start,
            ),
            SizedBox(height: 2,),
            Text(
              name,
              style: GoogleFonts.cairo(fontSize: 10),
            )
          ],
        )),
  );
}

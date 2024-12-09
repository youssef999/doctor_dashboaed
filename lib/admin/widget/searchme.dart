import 'package:doctor/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchMe extends StatelessWidget {
   SearchMe({
    super.key,
    required this.screenWidth,
    required this.controller,
  });

  final double screenWidth;
  var controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      width: screenWidth,
      height: 50,
      child: Expanded(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //  const SizedBox(width: 10),
              SizedBox(
                width: screenWidth * .95,
                height: 50,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    onChanged: (value) async {
                      controller.search.value = value;
                      value.length == 0
                          ? controller.search.value = ''
                          : controller.search.value = value;
                      controller.update();
                    },
                    decoration: InputDecoration(
                      hintText: 'ابحث',
                      hintStyle: GoogleFonts.cairo(
                          fontSize: 12,
                          color: AppColors.greyColor.withOpacity(.4)),
                      prefixIconConstraints:
                          const BoxConstraints.expand(
                              width: 30, height: 30),
                      prefixIcon: SvgPicture.asset(
                        'assets/icon/icon-search.svg',
                        color: AppColors.greyColor.withOpacity(.4),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: AppColors.whiteColor, width: 3)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: AppColors.whiteColor, width: 3)),
                      contentPadding: const EdgeInsets.only(
                          top: 10, right: 20, left: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: AppColors.whiteColor, width: 3)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
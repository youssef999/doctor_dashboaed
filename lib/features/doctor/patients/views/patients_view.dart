// ignore_for_file: avoid_print

import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/features/doctor/patients/controllers/patients_controller.dart';
import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/app_colors.dart';

class PatientsView extends GetView<PatientsController> {
  const PatientsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PatientsController());
    return Scaffold(
        backgroundColor: AppColors.mainlyZ,
        appBar: CustomAppBar('المرضي', context, false),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) async {},
                decoration: InputDecoration(
                  hintText: 'ابحث',
                  hintStyle: GoogleFonts.cairo(
                      fontSize: 12, color: AppColors.greyColor.withOpacity(.4)),
                  prefixIconConstraints:
                      const BoxConstraints.expand(width: 30, height: 30),
                  prefixIcon: SvgPicture.asset(
                    'assets/icon/icon-search.svg',
                    color: AppColors.greyColor.withOpacity(.4),
                  ),
                  contentPadding:
                      const EdgeInsets.only(top: 10, right: 20, left: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: AppColors.greyColor.withOpacity(0.1),
                          width: 3)),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                
                // scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return ContainButton(
                    name: 'ادهم محمود',
                    onTap: () {
                      Get.toNamed(Routes.PATIENTPROFILE);
                    },
                    isLog: false,
                  );
                },
                itemCount: 1,
              ),
            ],
          ),
        ));
  }
}

class ContainButton extends StatelessWidget {
  String name;
  void Function() onTap;
  bool isLog;
  ContainButton(
      {super.key,
      required this.onTap,
      required this.name,
      required this.isLog});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, right: 10, left: 20),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: AppColors.greyColor.withOpacity(.1)),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  name,
                  style: GoogleFonts.cairo(
                      fontSize: 12,
                      color: isLog == false
                          ? AppColors.darkColor
                          : AppColors.primaryBGLightColor),
                ),
              ],
            ),
            isLog == false
                ? Icon(Icons.arrow_forward_ios,
                    size: 15, color: AppColors.greyColor.withOpacity(.9))
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

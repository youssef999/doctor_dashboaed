// ignore_for_file: avoid_print

import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/features/user/alert/controller/alert_controller.dart';
import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/app_colors.dart';

class AlertView extends GetView<AlertController> {
  const AlertView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar('الادويه', context, false),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.only(right: 10, bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                        width: 1.2,
                        color: AppColors.greyColor.withOpacity(.1))),
                //width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 170,
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.medication_liquid_sharp,
                            color: Color.fromRGBO(59, 123, 255, 1),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'اسم الدواء',
                                    style: GoogleFonts.cairo(),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.notifications_active_outlined,
                                    size: 20,
                                    color: AppColors.primaryBGLightColor
                                        .withOpacity(.8),
                                  )
                                ],
                              ),
                              Text(
                                'اليوم 5:00 مساء',
                                style: GoogleFonts.cairo(
                                    fontSize: 10,
                                    color: AppColors.greyColor.withOpacity(.4)),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    right: 8, left: 8, top: 3, bottom: 3),
                                decoration: BoxDecoration(
                                    color: AppColors.greyColor.withOpacity(.35),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Text(
                                  'حبه واحده يوميا',
                                  style: GoogleFonts.cairo(
                                      color: AppColors.whiteColor,
                                      fontSize: 10),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: AppColors.greyColor.withOpacity(.4),
                            borderRadius: BorderRadius.circular(3)),
                        child: const Icon(
                          Icons.restore_from_trash_outlined,
                          color: AppColors.whiteColor,
                        ))
                  ],
                ),
              );
            },
            itemCount: 2,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.ADDALERT);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              margin: const EdgeInsets.only(
                  left: 15, right: 15, top: 15, bottom: 40),
              decoration: BoxDecoration(
                color: AppColors.primaryBGLightColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add_circle_outline_sharp,
                    color: AppColors.whiteColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'اضافه المنبه',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                      height: 1.3,
                      letterSpacing: -0.4,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

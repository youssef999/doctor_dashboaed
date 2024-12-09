// ignore_for_file: avoid_print

import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/features/user/doctorUser/controller/doctor_controller.dart';
import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CompletedView extends GetView<DoctorController> {
  const CompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 30),
              child: Image.asset(
                'assets/images/success.gif',
                scale: 3,
              ),
            ),
            Text(
              'تم الحجز بنجاح',
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                  fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
                'شكرا لك لحجز موعد لإجراء الفحص الطبي، نحن نقدر اهتمامكم بخدماتنا سيتم تحديد موعد مع الطبيب في  اقرب وقتب برجاء  متابعة من خلال شاشة حجوزاتك',
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                    fontSize: 12, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 20,
            ),
            Text(' دكتور  علي الياسري',
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                    fontSize: 15, fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 10,
            ),
            Text('اخصائي  طب الفم واسنان وجراحة وتقويم الاسنان ',
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                    color: AppColors.greyColor.withOpacity(.3),
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, right: 20, left: 20),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 1,
                          color: AppColors.greyColor.withOpacity(0.1)),
                      bottom: BorderSide(
                          width: 1,
                          color: AppColors.greyColor.withOpacity(0.1)))),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: AppColors.primaryBGLightColor.withOpacity(.7),
                        size: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('غدآ 8 مارس  ',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.cairo(
                              color: AppColors.greyColor.withOpacity(.3),
                              fontSize: 10,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors.primaryBGLightColor.withOpacity(.7),
                        size: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('العراق / محافظة النجف / حي الصحة',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.cairo(
                              color: AppColors.greyColor.withOpacity(.3),
                              fontSize: 10,
                              fontWeight: FontWeight.w500)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: buildBottomButton(),
    );
  }

  Widget buildBottomButton() {
    return GestureDetector(
      onTap: () {
         Get.toNamed(Routes.ROOT);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 40),
        decoration: BoxDecoration(
          color: const Color(0xFF04CE00),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          'تاكيد',
          textAlign: TextAlign.center,
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.w700,
            fontSize: 17,
            height: 1.3,
            letterSpacing: -0.4,
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: avoid_print

import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/core/widgets/custom_textformfield.dart';
import 'package:doctor/features/auth/controllers/auth_controller.dart';
import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/app_colors.dart';

class ResetView extends GetView<AuthController> {
  const ResetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar('نسيت كلمة المرور', context, false),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.OTP);
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15),
          margin:
              const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 40),
          decoration: BoxDecoration(
            color: const Color(0xFF04CE00),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            'نسيت كلمة المرور',
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
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFEFEFE),
        ),
        child: ListView(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 50),
          children: [
            Center(
              child: Image.asset(
                'assets/images/reset.png', // Ensure you have this image in your assets
                height: 300,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'يرجي كتابة رقم جوالك وسيتم ارسال رمز الي هاتفك لاسترجاع كلمة المرور',
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                height: 1.5,
                color: const Color(0xFF7D7D7D),
              ),
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              label: 'رقم الهاتف',
              obs: false,
              controller: TextEditingController(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

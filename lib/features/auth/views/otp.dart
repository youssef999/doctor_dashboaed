// ignore_for_file: avoid_print

import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/features/auth/controllers/auth_controller.dart';
import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/app_colors.dart';

class OtpView extends GetView<AuthController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar('التحقق من الرمز', context, false),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.NEWPASS);
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
            'تحقق من الرمز',
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
                'assets/images/otp.png', // Ensure you have this image in your assets
                height: 300,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'يرجي كتابة الرمز الذي تم ارساله الي رقم موبايل 0123456789',
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                height: 1.5,
                color: const Color(0xFF7D7D7D),
              ),
            ),
            const SizedBox(height: 30),
            OtpTextField(
              numberOfFields: 4,
              borderWidth: 1,
              //  borderColor: const Color.fromARGB(255, 92, 198, 90),
              showFieldAsBox: true,
              enabledBorderColor: AppColors.primaryBGLightColor,
              focusedBorderColor: AppColors.darkColor,
              // disabledBorderColor:AppColors.primaryBGLightColor,
              onCodeChanged: (String code) {
                // Handle code change
              },
              onSubmit: (String verificationCode) {
                // Handle OTP verification code submission
                print("OTP Submitted: $verificationCode");
              },
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Handle resend OTP
                print("Resend OTP tapped");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'إعادة ارسال الرمز',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xFF007BFF),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '00:30',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xFF7D7D7D),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

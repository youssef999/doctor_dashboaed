// ignore_for_file: avoid_print

import 'package:doctor/core/widgets/custom_textformfield.dart';
import 'package:doctor/features/auth/controllers/auth_controller.dart';
import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/app_colors.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.loginFormKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: null,
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFEFEFE),
          ),
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 280,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              height: 1.1,
                              color: const Color(0xFF000000),
                            ),
                            children: [
                              TextSpan(
                                text: 'مرحبا بك',
                                style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25,
                                  height: 1.3,
                                ),
                              ),
                              TextSpan(
                                text: '..',
                                style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25,
                                  height: 1.3,
                                ),
                              ),
                              TextSpan(
                                text: ' ',
                                style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/images/hand.png',
                          width: 30,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Text(
                          'login'.tr,
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            //  height: 1.3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      label: 'رقم الهاتف',
                      obs: false,
                      onChanged: (value) {
                        controller.roleId == '1'
                            ? controller.users.value.phoneNumber = value
                            : controller.doctor.value.phoneNumber = value;
                      },
                      controller: TextEditingController(),
                      max: 1,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      label: 'password'.tr,
                      obs: true,
                      onChanged: (value) {
                        controller.roleId == '1'
                            ? controller.users.value.password = value
                            : controller.doctor.value.password = value;
                      },
                      controller: TextEditingController(),
                      max: 1,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.RESET);
                        },
                        child: Text(
                          'نسيت كلمة السر',
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                            color: const Color(0xFF004FEA),
                            decorationColor: const Color(0xFF004FEA),
                          ),
                        ),
                      ),
                    ]),
                    GestureDetector(
                      onTap: () {

                      //  controller.login();
                         Get.toNamed(Routes.ROOT);
                        controller.roleId == '1'
                            ? controller.userLogin()
                            : controller.userLoginDoctor();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 30),
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFF04CE00),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'تسجيل الدخول',
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
                    Container(
                      //margin: const EdgeInsets.fromLTRB(0, 0, 193.2, 25),
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      child: Text(
                        'أو سجل دخول عبر حساب',
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          height: 1.2,
                          letterSpacing: -0.4,
                          color: const Color(0xFF000000),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 165,
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 13, bottom: 13),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0x80000000)),
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFFFFFFF),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'جوجل',
                                style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  height: 1.5,
                                  letterSpacing: -0.4,
                                  color: const Color(0xFF000000),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset('assets/icon/google.svg'),
                            ],
                          ),
                        ),
                        Container(
                          width: 165,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0x80000000)),
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFFFFFFF),
                          ),
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 13, bottom: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'فيسبوك',
                                style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  height: 1.5,
                                  letterSpacing: -0.4,
                                  color: const Color(0xFF000000),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset('assets/icon/facebook.svg')
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.roleId == '1'
                            ? Get.toNamed(Routes.REGISTER)
                            : Get.toNamed(Routes.REGISTERDOC);
                      },
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            // decoration: TextDecoration.underline,
                            height: 1.5,
                            letterSpacing: -0.4,
                            color: const Color(0xFF000000),
                            decorationColor: const Color(0xFF000000),
                          ),
                          children: [
                            TextSpan(
                              text: 'ليس لدي حساب, ',
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                // decoration: TextDecoration.underline,
                                height: 1.3,
                                letterSpacing: -0.4,
                              ),
                            ),
                            TextSpan(
                              text: 'مستخدم جديد',
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                                height: 1.3,
                                letterSpacing: -0.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

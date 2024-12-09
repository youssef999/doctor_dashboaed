// ignore_for_file: avoid_print

import 'package:doctor/core/resources/app_strings.dart';
import 'package:doctor/core/widgets/custom_textformfield.dart';
import 'package:doctor/features/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/app_colors.dart';

class RegisterViewDoctor extends GetView<AuthController> {
  const RegisterViewDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: null,
      body: Obx(() {
        return Form(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFFEFEFE),
            ),
            child: ListView(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 80, bottom: 50),
              children: [
                Text(
                  'انشاء حساب جديد',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    height: 1.1,
                    color: const Color(0xFF000000),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'اضف المعلومات الشخصية',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    // height: 1.1,
                    color: const Color(0xFF000000),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'يرجي تعبئة المعلومات التالية لانشاء الحساب',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    // height: 1.3,
                    color: const Color(0xFF7D7D7D),
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  label: 'الاسم',
                  obs: false,
                  onChanged: (value) {
                    // print(value);
                    // controller.nameController.text = value!;
                    controller.doctor.value.name = value;
                  },
                  controller: controller.nameController,
                  validateMessage: 'complete data',
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  label: 'البريد الالكتروني',
                  onChanged: (value) {
                    controller.doctor.value.email = value;
                  },
                  obs: false,
                  controller: controller.emailController,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  label: 'رقم الهاتف',
                  obs: false,
                  type: TextInputType.numberWithOptions(),
                  onChanged: (value) {
                    controller.doctor.value.phoneNumber = value;
                  },
                  controller: controller.phoneNumber,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  label: 'كلمة المرور',
                  obs: true,
                  onChanged: (value) {
                    controller.doctor.value.password = value;
                  },
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 20),
                dropDown('التخصص'.tr, controller.selectedCategories.value,
                    (String? newValue) {
                  if (newValue != null) {
                    controller.changeFilterCategory(newValue);
                    controller.doctor.value.cat = newValue;
                  }
                }, controller.categories),
                //    dropDown('اختر المدينه'),
                dropDown('الاقسام'.tr, controller.selectedBranch.value,
                    (String? newValuex) {
                  if (newValuex != null) {
                    controller.changeFilterArea(newValuex);
                    controller.doctor.value.secoundCat = newValuex;
                    print(newValuex);
                  }
                }, controller.selectedListCategory),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  label: 'سعر الكشف',
                  obs: false,
                  type: TextInputType.number,
                  onChanged: (value) {
                    controller.doctor.value.price = int.tryParse(value!);
                  },
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  label: 'سنوات الخبره',
                  obs: false,
                  type: TextInputType.number,
                  onChanged: (value) {
                    controller.doctor.value.expYear = value!;
                  },
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  label: 'درجه التعليم',
                  obs: false,
                  type: TextInputType.text,
                  onChanged: (value) {
                    controller.doctor.value.degree = value;
                  },
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  label: 'المؤهلات',
                  obs: false,
                  type: TextInputType.text,
                  onChanged: (value) {
                    controller.doctor.value.qualification = value;
                  },
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  label: 'اسم العياده',
                  obs: false,
                  type: TextInputType.text,
                  onChanged: (value) {
                    controller.doctor.value.clinikName = value;
                  },
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  label: 'الوصف',
                  obs: false,
                  type: TextInputType.text,
                  onChanged: (value) {
                    controller.doctor.value.details = value;
                  },
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Obx(() {
                      return Checkbox(
                        value: controller.isChecked.value,
                        onChanged: (bool? value) {
                          controller.isChecked.value == true
                              ? controller.isChecked.value = false
                              : controller.isChecked.value = true;
                          //controller.update();
                        },
                      );
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'ذكر',
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            height: 1.5,
                            color: const Color(0xFF000000),
                          ),
                        ),
                        Radio(
                          value: controller.radioGen.value == true ? 0 : 1,
                          groupValue: 0,
                          activeColor: AppColors.primaryBGLightColor,
                          onChanged: (int? value) {
                            controller.radioGen.value = true;
                            controller.doctor.value.gender = 'male';
                          },
                        ),
                        Text(
                          'أنثي',
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            height: 1.5,
                            color: const Color(0xFF000000),
                          ),
                        ),
                        Radio(
                          value: controller.radioGen.value == false ? 0 : 1,
                          groupValue: 0,
                          activeColor: AppColors.primaryBGLightColor,
                          onChanged: (int? value) {
                            // Handle radio button change
                            controller.radioGen.value = false;
                            controller.doctor.value.gender = 'female';
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'اوافق علي الشروط و الاحكام',
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                          height: 1.5,
                          color: const Color(0xFF004FEA),
                        ),
                      ),
                    ),
                  ],
                ),

                GestureDetector(
                  onTap: () {
                    Ui.logSuccess(controller.nameController.text);

                    controller.isChecked.value == true
                        ? controller.userSignUpDoctor()
                        : Get.showSnackbar(Ui.ErrorSnackBar(
                            message: 'You need to accept the terms first'));

                    //Get.toNamed(Routes.LOGIN);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF04CE00),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'انشاء حساب',
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
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget dropDown(String hint, String value, void Function(String?)? onChanged,
      RxList<String> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0, top: 20),
          child: Text(
            hint,
            style: GoogleFonts.cairo(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryBGLightColor),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.grey[100]!),
          child: DropdownButton<String>(
            isExpanded: true,
            value: value,
            onChanged: onChanged,
            items: data.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(value),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

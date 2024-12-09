import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/features/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/widgets/custom_textformfield.dart';

class ClinicView extends GetView<ProfileController> {
  const ClinicView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar('اعدادات العياده'.tr, context, false),
      body: Obx( () {
        return ListView(
            padding: EdgeInsets.only(left: 15, right: 15),
            children: [
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                label: 'اسم العياده',
                hint: controller.clinic.value.clinckName ?? '',
                obs: false,
                controller: TextEditingController(),
                onChanged: (value) {
                  controller.clinic.value.clinckName = value;
                },
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                label: 'عن العياده',
                hint: controller.clinic.value.txt ?? '',
                obs: false,
                controller: TextEditingController(),
                onChanged: (value) {
                  controller.clinic.value.txt = value;
                },
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                label: 'رقم الهاتف',
                obs: false,
                hint: controller.doctor.value.phoneNumber ?? '',
                controller: TextEditingController(),
                onChanged: (value) {
                  controller.doctor.value.phoneNumber = value;
                },
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                label: 'سعر الكشف',
                obs: false,
                hint: controller.doctor.value.price?.toString() ?? '0',
                controller: TextEditingController(),
                onChanged: (value) {
                  controller.doctor.value.price = int.tryParse(value ?? '');
                },
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                label: 'عنوان العياده',
                obs: false,
                hint: controller.clinic.value.address ?? '',
                controller: TextEditingController(),
                onChanged: (value) {
                  controller.clinic.value.address = value;
                },
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                label: 'اسم المساعد',
                obs: false,
                hint: controller.clinic.value.assistantName ?? '',
                controller: TextEditingController(),
                onChanged: (value) {
                  controller.clinic.value.assistantName = value;
                },
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                label: 'رقم المساعد',
                obs: false,
                hint: controller.clinic.value.assistantPhone ?? '',
                controller: TextEditingController(),
                onChanged: (value) {
                  controller.clinic.value.assistantPhone = value;
                },
              ),
              const SizedBox(height: 20),
            ]);
      }),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          controller.editClinic();
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
            'تعديل',
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
    );
  }
}

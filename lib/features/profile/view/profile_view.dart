import 'dart:io';

import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/features/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/widgets/custom_textformfield.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar('اعدادات الحساب'.tr, context, false),
      body:
          // Obx(() {
          // return
          GetBuilder<ProfileController>(builder: (_) {
        return ListView(
            padding: EdgeInsets.only(left: 15, right: 15),
            children: [
              (controller.pickedImageXFiles != null &&
                      controller.pickedImageXFiles!.isEmpty)
                  ? GetBuilder<ProfileController>(builder: (_) {
                      return Column(children: [
                        const SizedBox(
                          height: 6,
                        ),
                        for (int i = 0;
                            i < controller.pickedImageXFiles!.length;
                            i++)
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.41,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: FileImage(File(controller
                                                    .pickedImageXFiles![i]
                                                    .path)),
                                                fit: BoxFit.fill)),
                                      ),
                                      onTap: () {
                                        //  controller.pickMultiImage();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ]);
                    })
                  : InkWell(
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              'assets/images/doctor.jpeg',
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      onTap: () {
                        // controller.pickMultiImage();
                      },
                    ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                label: 'الاسم',
                hint: controller.roleId.value == '0'
                    ? controller.users.value.name ?? ''
                    : controller.doctor.value.name ?? '',
                obs: false,
                controller: TextEditingController(),
                onChanged: (value) {
                  controller.roleId.value == '0'
                      ? controller.users.value.name = value
                      : controller.doctor.value.name = value;
                },
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                label: 'البريد الالكتروني',
                hint: controller.roleId.value == '0'
                    ? controller.users.value.email ?? ''
                    : controller.doctor.value.email ?? 'doc@gmail.com',
                obs: false,
                controller: TextEditingController(),
                onChanged: (value) {
                  controller.roleId.value == '0'
                      ? controller.users.value.email = value
                      : controller.doctor.value.email = value;
                },
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                label: 'رقم الهاتف',
                obs: false,
                hint: controller.roleId.value == '0'
                    ? controller.users.value.phoneNumber ?? ''
                    : controller.doctor.value.phoneNumber ?? '',
                controller: TextEditingController(),
                onChanged: (value) {
                  controller.roleId.value == '0'
                      ? controller.users.value.phoneNumber = value
                      : controller.doctor.value.phoneNumber = value;
                },
              ),
              controller.roleId.value == '1'
                  ? CustomTextFormField(
                      label: 'سعر الكشف',
                      obs: false,
                      hint: controller.doctor.value.price?.toString() ?? '0',
                      controller: TextEditingController(),
                      onChanged: (value) {
                        controller.doctor.value.price =
                            int.tryParse(value ?? '');
                      },
                    )
                  : SizedBox(),
              controller.roleId.value == '1'
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0, top: 20),
                          child: Text(
                            'التخصص',
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
                            value: controller.selectedCategories.value,
                            onChanged: (v) {
                              controller.changeFilterCategory(v!);
                              controller.doctor.value.cat = v;
                            },
                            items: controller.categories
                                .map<DropdownMenuItem<String>>((String value) {
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
                    )
                  : SizedBox(),
              const SizedBox(height: 20),
              CustomTextFormField(
                label: 'كلمة المرور',
                obs: false,
                onChanged: (value) {
                  controller.roleId.value == '0'
                      ? controller.users.value.password = value
                      : controller.doctor.value.password = value;
                },
                hint: '*******',
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
            ]);
      }),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          controller.roleId.value == '0'
              ? controller.editProfile()
              : controller.editProfileDoctor();
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

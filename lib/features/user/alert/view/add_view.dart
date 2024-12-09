// ignore_for_file: avoid_print

import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/features/user/alert/controller/alert_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../core/resources/app_colors.dart';

class AddAlertView extends GetView<AlertController> {
  const AddAlertView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar('اضف الادويه', context, false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'اسم الدواء',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                // height: 1.3,
                color: const Color(0xFF000000),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller.medicineNameController,
              decoration: InputDecoration(
                hintText: 'ادخل اسم الدواء',
                hintStyle: GoogleFonts.cairo(
                    fontSize: 12, color: AppColors.greyColor.withOpacity(.4)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.greyColor.withOpacity(.1))),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.greyColor.withOpacity(.1))),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.greyColor.withOpacity(.1))),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'مواعيد استعمال الدواء',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFF000000),
              ),
            ),
            const SizedBox(height: 8),
            Obx(() {
              return DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(25),
                elevation: 0,
                value: controller.selectedQuantity.value.isEmpty
                    ? null
                    : controller.selectedQuantity.value,
                hint: const Text('اختر الكمية'),
                style: GoogleFonts.cairo(color: AppColors.darkColor),
                items: ['1', '2', '3', '4', '5']
                    .map((quantity) => DropdownMenuItem(
                          value: quantity,
                          child: Text(quantity,
                              style: GoogleFonts.cairo(
                                  color: AppColors.darkColor)),
                        ))
                    .toList(),
                onChanged: (value) {
                  controller.selectedQuantity.value = value!;
                },
                icon: const Icon(Icons.keyboard_arrow_down),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.greyColor.withOpacity(.1))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.greyColor.withOpacity(.1))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.greyColor.withOpacity(.1))),
                ),
              );
            }),
            const SizedBox(height: 16),
            Text(
              'موعد استعمال الدواء',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFF000000),
              ),
            ),
            const SizedBox(height: 8),
            Obx(() {
              return GestureDetector(
                onTap: () async {
                  final pickedTime = await showTimePicker(
                    context: context,
                    initialTime: controller.selectedTime.value,
                  );
                  if (pickedTime != null &&
                      pickedTime != controller.selectedTime.value) {
                    controller.selectedTime.value = pickedTime;
                  }
                },
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: DateFormat.jm().format(DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        controller.selectedTime.value.hour,
                        controller.selectedTime.value.minute,
                      )),
                      hintStyle: GoogleFonts.cairo(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.greyColor.withOpacity(.1))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.greyColor.withOpacity(.1))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.greyColor.withOpacity(.1))),
                      suffixIcon: const Icon(Icons.access_time),
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 16),
            Text(
              'الكمية',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFF000000),
              ),
            ),
            const SizedBox(height: 8),
            Obx(() {
              return DropdownButtonFormField<String>(
                style: GoogleFonts.cairo(color: AppColors.darkColor),
                value: controller.selectedQuantity.value.isEmpty
                    ? null
                    : controller.selectedQuantity.value,
                hint: const Text('اختر الكمية'),
                icon: const Icon(Icons.keyboard_arrow_down),
                items: ['1', '2', '3', '4', '5']
                    .map((quantity) => DropdownMenuItem(
                          value: quantity,
                          child: Text(quantity,
                              style: GoogleFonts.cairo(
                                  color: AppColors.darkColor)),
                        ))
                    .toList(),
                onChanged: (value) {
                  controller.selectedQuantity.value = value!;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.greyColor.withOpacity(.1))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.greyColor.withOpacity(.1))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.greyColor.withOpacity(.1))),
                ),
              );
            }),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                controller.stopAlarm();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE53935),
                  minimumSize: const Size(double.infinity, 50),
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Text(
                'إيقاف المنبه',
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  height: 1.3,
                  color: const Color(0xFFFFFFFF),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            controller.setAlarm();
          },
          style: ElevatedButton.styleFrom(
              // padding: const EdgeInsets.all(10),
              backgroundColor: const Color(0xFF04CE00),
              minimumSize: const Size(double.infinity, 50),
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          // icon: Icon(Icons.alarm_add,color: AppColors.whiteColor,),
          child: Text(
            'إضافة المنبه',
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              // height: 1.3,
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}

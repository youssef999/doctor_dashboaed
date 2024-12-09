// ignore_for_file: avoid_print

import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/features/driver/schedule/controllers/schedule_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/app_colors.dart';

class ScheduleView extends GetView<ScheduleController> {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ScheduleController());
    return Scaffold(
        backgroundColor: AppColors.mainlyZ,
        appBar: CustomAppBar('مواعيد عمل العياده', context, false),
        body: ListView(
          children: [
            _buildSectionHeader('مواعيد عمل العيادة', Icons.calendar_today),
            Divid(),
            _buildDaySchedule('السبت', controller.isSaturdayEnabled),
            _buildDaySchedule('الاحد', controller.isSundayEnabled),
            _buildDaySchedule('الاثنين', controller.isMondayEnabled),
            _buildDaySchedule('الثلاثاء', controller.isTuesdayEnabled),
            _buildDaySchedule('الاربعاء', controller.isWednesdayEnabled),
            _buildDaySchedule('الخميس', controller.isThursdayEnabled),
            _buildSectionHeader(
                'مواعيد استقبال المندوبين', Icons.calendar_today),
            _buildDaySchedule('السبت', controller.isSaturdayRepEnabled),
            _buildDaySchedule(
                'الاحد', controller.isSundayEnabled), // Reuse for example
          ],
        ));
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.cairo(
          fontWeight: FontWeight.w500,
          fontSize: 13,
          color: Colors.black,
        ),
      ),
      leading: Icon(icon, color: Colors.black),
    );
  }

  Widget _buildDaySchedule(String day, RxBool isEnabled) {
    return Obx(() {
      return Column(
        children: [
          ListTile(
            title: Text(
              day,
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            trailing: Switch(
              activeColor: AppColors.whiteColor,
              activeTrackColor: AppColors.blueColor,
              inactiveTrackColor: AppColors.greyColor.withOpacity(.15),
              dragStartBehavior: DragStartBehavior.down,
              trackOutlineColor:
              WidgetStateProperty.all(AppColors.greyColor.withOpacity(.01)),
              splashRadius: 80,
              inactiveThumbColor: AppColors.whiteColor,
              value: isEnabled.value,
              onChanged: (value) {
                isEnabled.value = value;
              },
            ),
          ),
          if (isEnabled.value)
            Container(
              height: 150,
              
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.greyColor.withOpacity(.1),
                  ),
                  borderRadius: BorderRadius.circular(3)),
              padding: const EdgeInsets.all( 16.0),
              margin: EdgeInsets.only(left: 20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'فتره العمل',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTimePicker('10:00 ص'),
                      _buildTimePicker('09:00 م'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '25 دقيقة',
                        style: GoogleFonts.cairo(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          Divid(),
        ],
      );
    });
  }

  Widget _buildTimePicker(String time) {
    return Column(
      children: [
        SizedBox(
          width: 80,
          child: TextFormField(
            initialValue: time,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ),
      ],
    );
  }
}

class Divid extends StatelessWidget {
  const Divid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: AppColors.greyColor.withOpacity(.1),
    );
  }
}

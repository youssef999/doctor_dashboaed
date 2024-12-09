// ignore_for_file: avoid_print

import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/core/widgets/custom_textformfield2.dart';
import 'package:doctor/features/user/doctorUser/controller/doctor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ReservationView extends GetView<DoctorController> {
  const ReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    Rx<bool> isEdit = false.obs;
    isEdit.value = box.read('isEdit');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          isEdit.value ? 'تعديل المعاد' : 'حجز مواعيد', context, false),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
        child: ListView(
          children: [
            DoctorProfile(
              img: 'assets/images/doctor.jpeg',
              name: 'دكتور علي الياسري',
              describe: 'اخصائي طب الفم و اسنان وجراحة الفم و تقويم الأسنان',
            ),
            Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: 1,
                            color: AppColors.greyColor.withOpacity(.2)),
                        bottom: BorderSide(
                            width: 1,
                            color: AppColors.greyColor.withOpacity(.2)))),
                child: buildDoctorDetails()),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildForm(),
                const SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20),
                  child: buildProgressIndicator(),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomButton(),
    );
  }

  Widget buildDoctorDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Icon(
              Icons.calendar_month_rounded,
              color: AppColors.primaryBGLightColor.withOpacity(.6),
              size: 20,
            ),
            const SizedBox(width: 5),
            Text('غداً 8 مارس',
                style: GoogleFonts.cairo(
                  color: AppColors.greyColor.withOpacity(.4),
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
        Row(
          children: [
            Icon(Icons.location_on,
                color: AppColors.primaryBGLightColor.withOpacity(.5), size: 20),
            const SizedBox(width: 5),
            Text('محافظة النجف / حي...',
                style: GoogleFonts.cairo(
                  color: AppColors.greyColor.withOpacity(.4),
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
        Row(children: [
          Icon(Icons.credit_card_outlined,
              color: AppColors.primaryBGLightColor.withOpacity(.8), size: 20),
          const SizedBox(width: 5),
          Text(
            '300 دينار',
            style: GoogleFonts.cairo(
              color: AppColors.greyColor.withOpacity(.4),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          )
        ]),
      ],
    );
  }

  Widget buildProgressIndicator() {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularPercentIndicator(
          radius: 10,
          lineWidth: 10,
          percent: 1,
          center: const Icon(
            Icons.check,
            color: Colors.white,
            size: 12,
          ),
          progressColor: AppColors.primaryBGLightColor.withOpacity(.8),
        ),
        Container(height: 50, width: 2, color: Colors.black),
        CircularPercentIndicator(
          radius: 10.0,
          lineWidth: 10.0,
          percent: 1,
          // center: const Icon(Icons.circle, color: Colors.white),
          progressColor: AppColors.primaryBGLightColor.withOpacity(.2),
        ),
        Container(height: 50, width: 2, color: Colors.black),
        CircularPercentIndicator(
          radius: 10.0,
          lineWidth: 10.0,
          percent: 1,
          // center: const Icon(Icons.circle, color: Colors.white),
          progressColor: AppColors.primaryBGLightColor.withOpacity(.2),
        ),
      ],
    );
  }

  Widget buildForm() {
    return SizedBox(
      height: 600,
      width: 300,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          CustomTextFormFieldV2(
            suffix: Icons.edit_outlined,
            label: 'الاسم كامل',
            hint: 'الاسم كامل',
            onChanged: (v) {
              controller.book.value.name = v;
            },
            controller: TextEditingController(),
          ),
          const SizedBox(height: 10),
          CustomTextFormFieldV2(
            label: 'تاريخ الحجز',
            hint: 'تاريخ الحجز',
            onChanged: (v) {
              controller.book.value.date = v;
            },
            controller: TextEditingController(),
          ),
          const SizedBox(height: 10),
          CustomTextFormFieldV2(
            label: 'رقم الهاتف',
            onChanged: (v) {
              controller.book.value.phone = v;
            },
            hint: 'رقم الهاتف',
            controller: TextEditingController(),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            'معلومات اضاقية للدكتور (اختياري)',
            style: GoogleFonts.cairo(),
          )),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormFieldV2(
            label: 'السن',
            hint: '',
            controller: TextEditingController(),
          ),
          const SizedBox(height: 10),
          CustomTextFormFieldV2(
            label: 'الاعراض',
            onChanged: (v) {
              controller.book.value.msg = v;
            },
            hint: 'مثل كحه والام الضهر',
            controller: TextEditingController(),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildBottomButton() {
        final box = GetStorage();
    Rx<bool> isEdit = false.obs;
    isEdit.value = box.read('isEdit');
    return GestureDetector(
      onTap: () {
      isEdit.value ? controller.editBooking():  controller.addBooking();
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
          'تاكيد الحجز',
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

class DoctorProfile extends StatelessWidget {
  String img;
  String name;
  String describe;
  DoctorProfile({
    required this.img,
    required this.name,
    required this.describe,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage:
                AssetImage(img), // Ensure you have this image in your assets
            radius: 20,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.cairo(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                describe,
                style: GoogleFonts.cairo(
                  color: Colors.black,
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

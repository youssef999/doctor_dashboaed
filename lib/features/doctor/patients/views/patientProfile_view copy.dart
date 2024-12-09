// ignore_for_file: avoid_print

import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/features/doctor/patients/controllers/patients_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/app_colors.dart';

class PatientProfileView extends GetView<PatientsController> {
  const PatientProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PatientsController());
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: CustomAppBar('بيانات المريض', context, false),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                // scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return PatientCart(
                    doctorName: 'دكتور علي الياسري',
                    doctorSpecialty:
                        'اخصائي طب الفم والأسنان وجراحة تقويم الاسنان',
                    location: 'العراق / محافظة النجف / حي الصحة',
                    bookingTime: 'غداً 8 مارس 2023  2:30 م',
                    price: '300 دينار',
                    isCancelled: false,
                  );
                },
                itemCount: 1,
              ),
            ],
          ),
        ));
  }
}

class PatientCart extends StatelessWidget {
  final String doctorName;
  final String doctorSpecialty;
  final String location;
  final String bookingTime;
  final String price;
  final bool isCancelled;

  PatientCart({
    required this.doctorName,
    required this.doctorSpecialty,
    required this.location,
    required this.bookingTime,
    required this.price,
    required this.isCancelled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      //  margin: const EdgeInsets.only(top: 16.0, right: 10, left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border:
              Border.all(width: 1, color: AppColors.greyColor.withOpacity(.1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: 30,
            padding: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: AppColors.greyColor.withOpacity(.1)))),
            child: Row(
              children: [
                Text(
                  'بيانات المريض',
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w600, fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            height: 170,
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: TxtWidget(doctorName: doctorName,
             doctorSpecialty: doctorSpecialty, location: location, bookingTime: bookingTime, 
             price: price, isCancelled: isCancelled

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 7, left: 7, right: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.red)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'حذف',
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Colors.red,
                            ),
                          ),
                          Icon(
                            Icons.delete_outlined,
                            color: AppColors.greyColor.withOpacity(.4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: AppColors.greyColor.withOpacity(.4),
                        )),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'رساله',
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              //color: Colors.red,
                            ),
                          ),
                          Icon(
                            Icons.messenger_outline_rounded,
                            color: AppColors.greyColor.withOpacity(.4),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: AppColors.greyColor.withOpacity(.4),
                        )),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'مكالمه',
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              // color: Colors.red,
                            ),
                          ),
                          Icon(
                            Icons.call_outlined,
                            color: AppColors.greyColor.withOpacity(.4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TxtWidget extends StatelessWidget {
  const TxtWidget({
    super.key,
    required this.doctorName, 
    required this.doctorSpecialty,
     required this.location, 
     required this.bookingTime, required this.price, required this.isCancelled,
  });

    final String doctorName;
  final String doctorSpecialty;
  final String location;
  final String bookingTime;
  final String price;
  final bool isCancelled;

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'اسم المريض',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppColors.greyColor.withOpacity(.5),
              ),
            ),
            Text(
              'السن',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppColors.greyColor.withOpacity(.5),
              ),
            ),
            Text(
              'النوع',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppColors.greyColor.withOpacity(.5),
              ),
            ),
            Text(
              'الاعراض',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppColors.greyColor.withOpacity(.5),
              ),
            ),
            Text(
              'التأمين',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppColors.greyColor.withOpacity(.5),
              ),
            ),
            Text(
              'رقم الهاتف',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppColors.greyColor.withOpacity(.5),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ياسر علي',
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: const Color(0xFF000000),
                )),
            Text(
             '28',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppColors.greyColor.withOpacity(.5),
              ),
            ),
            Text(
           'ذكر',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppColors.greyColor.withOpacity(.5),
              ),
            ),
            Text(
             'الام الظهر',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppColors.greyColor.withOpacity(.5),
              ),
            ),
            Text(
              '',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppColors.greyColor.withOpacity(.5),
              ),
            ),
            Text(
             '01120007266',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppColors.greyColor.withOpacity(.5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ignore_for_file: avoid_print

import 'package:doctor/features/doctor/home/controllers/homeDoctor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/app_colors.dart';

class HomeDoctorView extends GetView<HomeDoctorController> {
  const HomeDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeDoctorController());
    return Scaffold(
      backgroundColor: AppColors.mainlyZ,
      //  appBar: CustomAppBar('بيانات الطبيب', context, true),
      body: DefaultTabController(
        length: 2,
        child: Obx(() {
          return ListView(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/exampleDoc.jpeg', // Ensure you have this image in your assets
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 140,
                    right: 20,
                    child: Container(
                      height: 120,
                      width: 116,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                      child: Image.network(
                        controller.doctor.value.image ??
                            'https://images.pexels.com/photos/5215024/pexels-photo-5215024.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 210,
                      right: 150,
                      child: Text(
                        controller.doctor.value.name ?? '',
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          // height: 1.1,
                          color: const Color(0xFF000000),
                        ),
                      )),
                  const SizedBox(height: 5),
                  Positioned(
                      top: 230,
                      right: 150,
                      child: Text(
                        controller.doctor.value.qualification ?? '',
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          // height: 1.3,
                          color: AppColors.greyColor.withOpacity(.4),
                        ),
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
              const SizedBox(height: 80),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    //width: double.infinity,pa
                    padding: const EdgeInsets.only(
                        top: 5, left: 6, right: 6, bottom: 5),
                    margin: const EdgeInsets.only(
                        top: 0, left: 20, right: 20, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.whiteColor,
                      border: Border.all(
                          color: AppColors.greyColor.withOpacity(0.1)),
                    ),
                    child: TabBar(
                        unselectedLabelColor:
                            AppColors.greyColor.withOpacity(0.3),
                        indicatorSize: TabBarIndicatorSize.values[0],
                        labelColor: AppColors.mainly,
                        indicatorColor: Colors.blueAccent,
                        labelStyle: GoogleFonts.cairo(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        indicatorWeight: 0,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primaryBGLightColor),
                        dividerHeight: 00,
                        tabs: const [
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("معلومات عن الدكتور"),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("العياده"),
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1.2,
                    child: TabBarView(
                      children: [
                        Column(children: [
                          _expandableTile(
                              'معلومات عن الدكتور',
                              controller.doctor.value.details ?? 'No Details',
                              Icons.person_outline_outlined),
                          _expandableTileList(
                              'التخصصات الفرعية',
                              controller.doctor.value.secoundCat
                                  .toString()
                                  .split(','),
                              Icons.medical_information_outlined),
                          _expandableTile(
                              'المؤهلات الطبية',
                              controller.doctor.value.degree ??
                                  'No Information',
                              Icons.school_outlined),
                        ]),
                        Column(children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 25, right: 25, top: 10, bottom: 10),
                            clipBehavior: Clip.antiAlias,
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Image.network(
                              controller.clinic.value.image != ''
                                  ? controller.clinic.value.image ?? 'https://images.pexels.com/photos/5910953/pexels-photo-5910953.jpeg'
                                  : 'https://images.pexels.com/photos/5910953/pexels-photo-5910953.jpeg',
                              fit: BoxFit.fill,
                            ),
                          ),
                          _expandableTile(
                              'اسم و رقم العيادة',
                              controller.clinic.value.clinckName ??
                                  'No Details',
                              Icons.person_outline_outlined),
                          _expandableTile(
                              'سعر الكشف والاستشارة',
                              controller.clinic.value.price?.toString() ??
                                  'No Information',
                              Icons.medical_information_outlined),
                          _expandableTile(
                              'عنوان العيادة',
                              (controller.clinic.value.address?.isNotEmpty ??
                                      false)
                                  ? controller.clinic.value.address ?? ''
                                  : 'No Information',
                              Icons.school_outlined),
                          _expandableTile(
                              'اسم ورقم مساعد الدكتور',
                              (controller.clinic.value.assistantName ??
                                      'No Details') +
                                  '\n' +
                                  (controller.clinic.value.assistantPhone ??
                                      ''),
                              Icons.call_end_outlined),
                        ]),
                        //  const RateDoctor(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _expandableTile(String title, String content, IconData icon) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        //padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.greyColor.withOpacity(0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 25,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      // height: 1.3,
                      color: const Color(0xFF000000),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: AppColors.greyColor.withOpacity(.1),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                content,
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w400,
                  fontSize: 11,
                  // color: const Color(0xFF7D7D7D),
                ),
              ),
            )
          ],
        ));
  }

  Widget _expandableTileList(String title, List content, IconData icon) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        //padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.greyColor.withOpacity(0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 25,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      // height: 1.3,
                      color: const Color(0xFF000000),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: AppColors.greyColor.withOpacity(.1),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              height: 70,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppColors.primaryBGLightColor.withOpacity(.5),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        content[index],
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: AppColors.whiteColor),
                      ),
                    ),
                  );
                },
                itemCount: content.length,
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        ));
  }
}

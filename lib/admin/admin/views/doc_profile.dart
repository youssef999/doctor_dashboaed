

// ignore_for_file: avoid_print

import 'package:doctor/core/widgets/adv.dart';
import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/features/user/doctorUser/controller/doctor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/app_colors.dart';

class DoctorAdminProfileView extends GetView<DoctorController> {

  Map<String,dynamic>data;
  DoctorAdminProfileView({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorController());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar('بيانات الطبيب', context, true),
      body: DefaultTabController(
        length: 3,
        child: Obx(() {
          return ListView(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/backDoc.jpeg', // Ensure you have this image in your assets
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 150,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          controller.doctor.value.image ??
                              'https://images.pexels.com/photos/5215024/pexels-photo-5215024.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                        ), // Ensure you have this image in your assets
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Center(
                child: Column(
                  children: [
                    Text(
                    //  controller.doctor.value.name 
                      data['name']
                      ?? '',
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        // height: 1.1,
                        color: const Color(0xFF000000),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                    //  controller.doctor.value.qualification
                      
                      data['qualifications']
                       ?? '',
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        // height: 1.3,
                        color: AppColors.greyColor.withOpacity(.4),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),

                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: AppColors.greyColor.withOpacity(.1))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _infoTile(
                              'سعر الكشف',
                              '${data['price']} دينار',
                              Icons.credit_card),
                          _infoTile(
                              'مدة الانتظار', '30 دقيقة', Icons.timelapse),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _statTile('+500', 'مرضي', 'assets/icon/people.svg'),
                        _statTile('${controller.doctor.value.rate}', 'تقييم',
                            'assets/icon/star.svg'),
                        _statTile('${controller.doctor.value.expYear} سنوات',
                            'سنوات خبرة', 'assets/icon/status.svg'),
                        _statTile('5000', 'تعليق', 'assets/icon/comment.svg'),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.greyColor.withOpacity(0.1))),
                      ),
                    ),
                    _bookingSection(),
                    const SizedBox(height: 20),
                    Directionality(
                      textDirection:TextDirection.rtl,
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: AppColors.greyColor.withOpacity(0.1)),
                              bottom: BorderSide(
                                  color: AppColors.greyColor.withOpacity(0.1))),
                        ),
                        child: Container(
                          //width: double.infinity,pa
                          padding: const EdgeInsets.only(
                              top: 5, left: 6, right: 6, bottom: 5),
                          margin: const EdgeInsets.only(
                              top: 5, left: 5, right: 5, bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                                  fontSize: 9, fontWeight: FontWeight.bold),
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
                                Tab(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("تقييمات الزائرين"),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 1.2,
                      margin: EdgeInsets.only(top: 20),
                      child: TabBarView(
                        children: [
                          Column(children: [
                            _expandableTile(
                                'معلومات عن الدكتور',
                                controller.doctor.value.details ??
                                    'No Details'),
                            _expandableTile('التخصصات الفرعية',
                                'تركيبات أسنان, اسنان أطفال, تجميل اسنان, جراحة وجه وفكين'),
                            _expandableTile(
                                'المؤهلات الطبية',
                                controller.doctor.value.degree ??
                                    'No Information'),
                          ]),
                          const Clinic(),
                          const RateDoctor(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _infoTile(String title, String value, IconData icon) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: const Color(0xFF000000),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Icon(icon),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: const Color.fromARGB(255, 159, 159, 159),
          ),
        ),
      ],
    );
  }

  Widget _statTile(String value, String label, String svg) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 1, color: AppColors.greyColor.withOpacity(.1))),
          child: SvgPicture.asset(
            svg,
            width: 20,
            color: AppColors.primaryBGLightColor.withOpacity(.45),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          value,
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: const Color(0xFF000000),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: const Color.fromARGB(255, 170, 170, 170),
          ),
        ),
      ],
    );
  }

  Widget _bookingSection() {
    return Column(
      children: [
        Text(
          'اختر ميعاد حجزك',
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: const Color(0xFF000000),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _bookingTile('الثلاث', '01:00 م الى 08:00 م'),
            _bookingTile('غدا', '01:00 م الى 08:00 م'),
            _bookingTile('اليوم', '08:00 ص الى 08:00 م'),
          ],
        ),
      ],
    );
  }

  Widget _bookingTile(String day, String time) {
    return Container(
      width: 120,
      height: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border:
              Border.all(width: 1, color: AppColors.greyColor.withOpacity(.2))),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 25,
            decoration: BoxDecoration(
              color: AppColors.primaryBGLightColor.withOpacity(.45),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                day,
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '01:00 م',
                  style: GoogleFonts.cairo(),
                ),
                Text('الي', style: GoogleFonts.cairo()),
                Text('08:00 م', style: GoogleFonts.cairo()),
                const SizedBox(height: 5),
                // GestureDetector(
                //   onTap: () {
                //     final box = GetStorage();
                //     box.write('isEdit', false);
                //     Get.toNamed(Routes.RESERVE);
                //   },
                //   child: Container(
                //     width: double.infinity,
                //     padding:
                //         const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                //     margin: const EdgeInsets.only(right: 5, left: 5),
                //     decoration: BoxDecoration(
                //       color: const Color(0xFF04CE00),
                //       borderRadius: BorderRadius.circular(5),
                //     ),
                //     child: Center(
                //       child: Text(
                //         'حجز',
                //         style: GoogleFonts.cairo(
                //           fontWeight: FontWeight.w500,
                //           fontSize: 12,
                //           color: const Color(0xFFFFFFFF),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _expandableTile(String title, String content) {
    return ExpansionTile(
      title: Text(
        title,
        style: GoogleFonts.cairo(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          height: 1.3,
          color: const Color(0xFF000000),
        ),
      ),
      children: [
        ListTile(
          subtitle: Text(
            content,
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: const Color(0xFF7D7D7D),
            ),
          ),
        ),
      ],
    );
  }
}

class RateDoctor extends StatelessWidget {
  const RateDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoctorController());

    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 15, left: 10, right: 15),
          padding: const EdgeInsets.all(10),
          //height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                  width: .7, color: AppColors.greyColor.withOpacity(.1))),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    backgroundImage: NetworkImage(
                  controller.comments[index].image != ''
                      ? controller.comments[index].image!
                      : 'https://images.pexels.com/photos/5215024/pexels-photo-5215024.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                )),
                SizedBox(
                  width: 180,
                  //height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.comments[index].name ?? '',
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: List.generate(
                            (controller.comments[index].rate?.round() ?? 0),
                            (index) {
                          return const Icon(
                            Icons.star_rate_rounded,
                            color: Colors.orangeAccent,
                            size: 18,
                          );
                        }),
                      ),
                      Text(
                        controller.comments[index].comment ?? '',
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w400,
                          fontSize: 8,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'الاحد 13 يناير 2023',
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                )
              ]),
        );
      },
      itemCount: controller.comments.length,
    );
  }
}

class Clinic extends StatelessWidget {
  const Clinic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    width: .7, color: AppColors.greyColor.withOpacity(.2))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AdvWidget(),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5, right: 20),
                  child: Text(
                    'نقدم لكم احدث الاجهذه الموجودة في العيادة',
                    style: GoogleFonts.cairo(
                        fontSize: 10, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: AppColors.primaryBGLightColor,
                            size: 15,
                          ),
                          Text(
                            'منذ ساعه',
                            style: GoogleFonts.cairo(
                                fontSize: 10,
                                color: AppColors.greyColor.withOpacity(.3)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.share,
                            color: AppColors.primaryBGLightColor,
                            size: 15,
                          ),
                          Text(
                            'مشاركه',
                            style: GoogleFonts.cairo(
                                fontSize: 10,
                                color: AppColors.greyColor.withOpacity(.3)),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ));
      },
      itemCount: 2,
    );
  }
}

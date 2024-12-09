// ignore_for_file: avoid_print

import 'package:doctor/core/widgets/adv.dart';
import 'package:doctor/features/driver/home/controllers/homeDriver_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/app_colors.dart';

class HomeDriverView extends GetView<HomeDriverController> {
  const HomeDriverView({super.key});

  @override
  Widget build(BuildContext context) {
Get.lazyPut(()=>HomeDriverController());
    return Scaffold(
      backgroundColor: AppColors.mainlyZ,
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
                        'https://images.pexels.com/photos/5215024/pexels-photo-5215024.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    Text(
                      controller.doctor.value.name ?? '',
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        // height: 1.1,
                        color: const Color(0xFF000000),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      controller.doctor.value.qualification ?? '',
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        // height: 1.3,
                        color: AppColors.greyColor.withOpacity(.4),
                      ),
                      textAlign: TextAlign.center,
                    ),
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
                            _expandableTile(
                                'التخصصات الفرعية',
                                'تركيبات أسنان, اسنان أطفال, تجميل اسنان, جراحة وجه وفكين',
                                Icons.medical_information_outlined),
                            _expandableTile(
                                'المؤهلات الطبية',
                                controller.doctor.value.degree ??
                                    'No Information',Icons.school_outlined),
                          ]),
                          const Clinic(),
                          //  const RateDoctor(),
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
}

class RateDoctor extends StatelessWidget {
  const RateDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
                SizedBox(
                  width: 180,
                  //height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'هناء الطويل',
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: Colors.orangeAccent,
                            size: 18,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            color: Colors.orangeAccent,
                            size: 18,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            color: Colors.orangeAccent,
                            size: 18,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            color: Colors.orangeAccent,
                            size: 18,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            color: Colors.orangeAccent,
                            size: 18,
                          )
                        ],
                      ),
                      Text(
                        'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد',
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
      itemCount: 2,
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
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
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

import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/features/doctor/appointDoc/controller/appointDoc_controller.dart';
import 'package:doctor/features/doctor/appointDoc/view/submit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/booking_model.dart';

class AppointmentDoctorView extends GetView<AppointmentDoctorController> {
  const AppointmentDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
   AppointmentDoctorController controller= Get.put(AppointmentDoctorController());
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: CustomAppBar('الحجوزات'.tr, context, false),
        body: DefaultTabController(
          length: 2,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: AppColors.greyColor.withOpacity(.2)))),
                  child: TabBar(
                      // padding: EdgeInsets.all(0),
                      //labelPadding: EdgeInsets.all(0),
                      unselectedLabelColor: AppColors.greyColor.withOpacity(.4),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: AppColors.whiteColor,
                      //indicatorColor: Colors.blueAccent,

                      labelStyle: GoogleFonts.cairo(
                          fontSize: 13, fontWeight: FontWeight.w500),
                      indicatorWeight: 0,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: .5,
                              color: AppColors.greyColor.withOpacity(.5)),
                          color: AppColors.primaryBGLightColor),
                      dividerHeight: 0,
                      tabs: const [
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('قائمه الحجوزات'),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('الحجوزات المعلقه'),
                          ),
                        ),
                      ]),
                ),
                Obx(() {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 1.2,
                    child: TabBarView(
                      children: [
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return 
                            // controller.booking[index].status != 'pending'
                            //     ?
                                 Container(
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(bottom: 15),
                                    decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          width: .5,
                                          color: AppColors.greyColor
                                              .withOpacity(0.2),
                                        )),
                                    height: 80,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            (controller.booking[index].image
                                                        ?.isEmpty ??
                                                    false)
                                                ? 'https://images.pexels.com/photos/3991782/pexels-photo-3991782.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
                                                : controller
                                                        .booking[index].image ??
                                                    '',
                                          ),
                                          radius: 30,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              controller.booking[index]
                                                      .userName ??
                                                  '',
                                              style: GoogleFonts.cairo(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              controller.booking[index].msg ??
                                                  '',
                                              style: GoogleFonts.cairo(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 30),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.warning_amber_rounded,
                                              color: AppColors.greyColor
                                                  .withOpacity(.5),
                                            ),
                                            Text(
                                              '${controller.booking[index].time ?? ''} - ${controller.booking[index].date ?? ''}',
                                              style: GoogleFonts.cairo(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                              //  : SizedBox();
                          },
                          itemCount: controller.booking.length,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.person_off_outlined,
                                  color: AppColors.greyColor.withOpacity(.7),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'الحجوزات المعلقه',
                                  style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: AppColors.darkColor),
                                )
                              ],
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return controller.booking[index].status ==
                                        'pending'
                                    ? BookingCard(
                                      book: controller.booking[index],
                                        patientName: controller
                                                .booking[index].userName ??
                                            '',
                                        patientMsg:
                                            controller.booking[index].msg ?? '',
                                        bookingTime:
                                            controller.booking[index].date ??
                                                '',
                                        patientImage:
                                            controller.booking[index].image ??
                                                '',
                                      )
                                    : SizedBox();
                              },
                              itemCount: controller.booking.length,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
                // Booking List
              ],
            ),
          ),
        ));
  }
}

class BookingCard extends StatelessWidget {
  final String patientName;
  final String patientMsg;
  final String bookingTime;
  final String patientImage;
  Booking book;

 
  BookingCard({
    required this.patientName,
    required this.book,
    required this.patientMsg,
    required this.bookingTime,
    required this.patientImage,
  });

  @override
  Widget build(BuildContext context) {
     AppointmentDoctorController controller= Get.put(AppointmentDoctorController());
    return Container(
      height: 190,
      margin: const EdgeInsets.only(top: 16.0, right: 10, left: 10),
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
            padding: const EdgeInsets.only(right: 20, left: 20),
            decoration: BoxDecoration(
                // color: !isCancelled ? AppColors.primaryBGLightColor : null,
                borderRadius: BorderRadius.circular(3),
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: AppColors.greyColor.withOpacity(.1)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'طلب حجز جديد',
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppColors.darkColor),
                ),
                Text(
                  'غدا',
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppColors.darkColor),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: 380,
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      patientImage), // Replace with your asset image path
                  radius: 38,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        patientName,
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: const Color(0xFF000000),
                        ),
                      ),
                      Text(
                        patientMsg,
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: AppColors.greyColor.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.warning_amber_rounded,
                  color: AppColors.greyColor.withOpacity(.5),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 7,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                   // Get.toNamed(Routes.SUBMITAPPOINT);
                    Get.to(SubmitAppointmentView(
                     booking: book
                    ));
                  },
                  child: Container(
                    width: 130,
                    height: 30,
                    decoration: BoxDecoration(
                        color: AppColors.primaryBGLightColor,
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text(
                        'قبول',
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {

                     controller.changeBookingStatus(book.id.toString(), 
                     'Refuse');
                    
                  },
                  child: Container(
                    width: 130,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 1,
                            color: AppColors.greyColor.withOpacity(.1)),
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text(
                        'رفض',
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: AppColors.primaryBGLightColor,
                        ),
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

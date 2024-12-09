import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/features/user/appointments/controller/apointment_controller.dart';
import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentView extends GetView<AppointmentController> {
  const AppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AppointmentController());
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: CustomAppBar('الحجوزات'.tr, context, false),
        body: DefaultTabController(
          length: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(

              children: [
                // Top Filters
                Container(
                  margin: const EdgeInsets.only(bottom: 0),
                  child: TabBar(
                      unselectedLabelColor: AppColors.primaryBGLightColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: AppColors.whiteColor,
                      onTap: (value) {
                        print('text $value');
                      },
                      labelStyle: GoogleFonts.cairo(
                          fontSize: 11, fontWeight: FontWeight.w500),
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
                            child: Text('الجميع'),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('كشف عيادة'),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("استشارة"),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('تم الالغاء'),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 5,
                  child: Obx(() {
                    return TabBarView(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BookingCard(
                              id: controller.book[index].id ?? '',
                              doctorName: controller.book[index].name ?? '',
                              img: controller.book[index].image ?? '',
                              doctorSpecialty:
                                  controller.book[index].qualifications ?? '',
                              location: 'العراق / محافظة النجف / حي الصحة',
                              bookingTime: controller.book[index].date ?? '',
                              price: controller.book[index].price ?? '',
                              isCancelled:
                                  controller.book[index].type == "تم الإلغاء"
                                      ? true
                                      : false,
                              onTapEdit: () {
                                final box = GetStorage();
                                box.write('isEdit', true);
                                Get.toNamed(Routes.RESERVE, arguments: {
                                  'doctor': controller.doctor[index],
                                  'bookId': controller.book[index].id
                                });
                              },
                            );
                          },
                          itemCount: controller.book.length,
                        ),
                        ListView.builder(
                         shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return controller.book[index].type == 'كشف عيادة'
                                ? BookingCard(
                                    id: controller.book[index].id ?? '',
                                    doctorName:
                                        controller.book[index].name ?? '',
                                    img: controller.book[index].image ?? '',
                                    doctorSpecialty:
                                        controller.book[index].qualifications ??
                                            '',
                                    location:
                                        'العراق / محافظة النجف / حي الصحة',
                                    bookingTime:
                                        controller.book[index].date ?? '',
                                    price: controller.book[index].price ?? '',
                                    isCancelled: false,
                                    onTapEdit: () {
                                      final box = GetStorage();
                                      box.write('isEdit', true);
                                      Get.toNamed(Routes.RESERVE, arguments: {
                                        'doctor': controller.doctor[index],
                                        'bookId': controller.book[index].id
                                      });
                                    },
                                  )
                                : SizedBox();
                          },
                          itemCount: controller.book.length,
                        ),
                        ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return controller.book[index].type == 'استشارة'
                                ? BookingCard(
                                    id: controller.book[index].id ?? '',
                                    doctorName:
                                        controller.book[index].name ?? '',
                                    img: controller.book[index].image ?? '',
                                    doctorSpecialty:
                                        controller.book[index].qualifications ??
                                            '',
                                    location:
                                        'العراق / محافظة النجف / حي الصحة',
                                    bookingTime:
                                        controller.book[index].date ?? '',
                                    price: controller.book[index].price ?? '',
                                    isCancelled: false,
                                    onTapEdit: () {
                                      final box = GetStorage();
                                      box.write('isEdit', true);
                                      Get.toNamed(Routes.RESERVE, arguments: {
                                        'doctor': controller.doctor[index],
                                        'bookId': controller.book[index].id
                                      });
                                    },
                                  )
                                : SizedBox();
                          },
                          itemCount: controller.book.length,
                        ),
                        ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return controller.book[index].type == "تم الإلغاء"
                                ? BookingCard(
                                    id: controller.book[index].id ?? '',
                                    doctorName:
                                        controller.book[index].name ?? '',
                                    img: controller.book[index].image ?? '',
                                    doctorSpecialty:
                                        controller.book[index].qualifications ??
                                            '',
                                    location:
                                        'العراق / محافظة النجف / حي الصحة',
                                    bookingTime:
                                        controller.book[index].date ?? '',
                                    price: controller.book[index].price ?? '',
                                    isCancelled: true,
                                    onTapEdit: () {
                                      final box = GetStorage();
                                      box.write('isEdit', true);
                                      Get.toNamed(Routes.RESERVE, arguments: {
                                        'doctor': controller.doctor[index],
                                        'bookId': controller.book[index].id
                                      });
                                    },
                                  )
                                : SizedBox();
                          },
                          itemCount: controller.book.length,
                        ),
                      ],
                    );
                  }),
                ),
                // Booking List
              ],
            ),
          ),
        ));
  }
}

class BookingCard extends StatelessWidget {
  final String doctorName;
  final String doctorSpecialty;
  final String location;
  final String bookingTime;
  final String img;
  final String id;
  final String price;
  final bool isCancelled;
  void Function()? onTapEdit;

  BookingCard({
    super.key,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.location,
    required this.img,
    required this.id,
    required this.bookingTime,
    required this.price,
    required this.onTapEdit,
    required this.isCancelled,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppointmentController>();
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
            padding: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                color: !isCancelled ? AppColors.primaryBGLightColor : null,
                borderRadius: BorderRadius.circular(3),
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: AppColors.greyColor.withOpacity(.1)))),
            child: Row(
              children: [
                isCancelled
                    ? Text(
                        'تم الغاء',
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: Colors.red,
                        ),
                      )
                    : const SizedBox(),
                isCancelled
                    ? const SizedBox(
                        width: 10,
                      )
                    : const SizedBox(),
                Text(
                  'كشف عيادة $bookingTime',
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: !isCancelled
                        ? AppColors.whiteColor
                        : AppColors.greyColor.withOpacity(.3),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: 380,
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(img), // Replace with your asset image path
                  radius: 38,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        doctorName,
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: const Color(0xFF000000),
                        ),
                      ),
                      Text(
                        doctorSpecialty,
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: AppColors.greyColor.withOpacity(0.4),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_pin,
                              size: 14, color: Colors.green),
                          const SizedBox(width: 5),
                          Text(
                            location,
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: AppColors.greyColor.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 7, left: 7, right: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!isCancelled) ...[
                  GestureDetector(
                    onTap: () {
                      controller.removeBooking(id);
                    },
                    child: Container(
                      width: 90,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child: Text(
                          'الغاء الحجز',
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.white,
                          ),
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
                          color: AppColors.primaryBGLightColor,
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'الخريطه',
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.location_on_outlined,
                            color: AppColors.whiteColor,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onTapEdit,
                    child: Container(
                      width: 90,
                      height: 30,
                      decoration: BoxDecoration(
                          color: AppColors.primaryBGLightColor,
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'تعديل',
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Icon(
                            Icons.edit_outlined,
                            color: AppColors.whiteColor,
                            size: 13,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                if (isCancelled) ...[
                  GestureDetector(
                    onTap: () {
                      controller.removeBooking(id);
                    },
                    child: Container(
                      width: 90,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child: Text(
                          'حذف',
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.white,
                          ),
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
                          color: AppColors.primaryBGLightColor,
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'اعاده الحجز',
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Icon(
                            Icons.repeat_outlined,
                            color: AppColors.whiteColor,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 90,
                      height: 30,
                      decoration: BoxDecoration(
                          color: AppColors.primaryBGLightColor,
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'تعديل',
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Icon(
                            Icons.edit_outlined,
                            color: AppColors.whiteColor,
                            size: 13,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

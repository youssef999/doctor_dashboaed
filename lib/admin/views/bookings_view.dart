import 'package:doctor/admin/controller/booking_controller.dart';
import 'package:doctor/admin/widget/searchme.dart';
import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/core/resources/app_validations.dart';
import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingsView extends StatefulWidget {
  const BookingsView({super.key});
  @override
  State<BookingsView> createState() => _BookingsViewState();
}

class _BookingsViewState extends State<BookingsView> {
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>(); // Unique Key

  BookingController controller = Get.put(BookingController());
  @override
  void initState() {
    controller.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar('الحجوزات', context, false),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SearchMe(screenWidth: screenWidth, controller: controller),
          SizedBox(
            height: 10,
          ),
          GetBuilder<BookingController>(builder: (_) {
            print('drops $screenWidth');
            double x = screenWidth;
            screenWidth <= 650 ? x = 350 : x = 505;
            return Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return controller.data[index]
                                .toString()
                                .toLowerCase()
                                .contains('${controller.search.value}') ||
                            controller.data[index]
                                .toString()
                                .contains('${controller.search.value}')
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: BookingCard(
                                data: controller.data[index],
                                screenWidth: screenWidth,
                                isCancelled: controller.data[index]['status'] ==
                                    'Refuse'))
                        : SizedBox();
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    // maxCrossAxisExtent: screenWidth * .5, // Max width per card
                    mainAxisSpacing: 5,
                   // mainAxisExtent: x,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.91
                  )),
            );
          }),
        ],
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final bool isCancelled;
  double screenWidth;
  BookingCard({
    super.key,
    required this.screenWidth,
    required this.data,
    this.isCancelled = false,
  });

  @override
  Widget build(BuildContext context) {
    BookingController controller = Get.put(BookingController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin:
            EdgeInsets.symmetric(vertical: 16, horizontal: screenWidth * .01),
        padding: EdgeInsets.all(screenWidth * .01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Booking Details
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: isCancelled ? null : AppColors.primaryBGLightColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "تاريخ الحجز : ${data['date']}",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * .01,
                        color: isCancelled ? Colors.grey : AppColors.whiteColor,
                      ),
                    ),
                    Text(
                      "وقت الحجز : ${data['time']}",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * .01,
                        color: isCancelled ? Colors.grey : AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Doctor Info
            Text(
              "بيانات الطبيب",
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(data['image']),
                  radius: screenWidth * .03, // Responsive image size
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow(
                        "الاسم",
                        data['name'],
                        screenWidth,
                      ),
                      _buildInfoRow(
                        "البريد الالكتروني",
                        data['email'],
                        screenWidth,
                      ),
                      _buildInfoRow(
                        "رقم الهاتف",
                        data['phone'],
                        screenWidth,
                      ),
                      _buildInfoRow(
                          "المؤهلات", data['qualifications'], screenWidth),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            // User Info
            Text(
              "بيانات المستخدم",
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w600,
                fontSize: screenWidth * .01,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow("اسم المستخدم", data['user_name'], screenWidth),
                _buildInfoRow(
                  "بريد المستخدم",
                  data['user_email'],
                  screenWidth,
                ),
                _buildInfoRow("هاتف المستخدم", data['user_phone'], screenWidth),
              ],
            ),
            const SizedBox(height: 10),
            // Action Buttons
            if (!isCancelled)
              _buildActionButton(
                "الغاء الحجز",
                Colors.red,
                screenWidth,
                () {
                  AppValidations.showMessageBoxDelete(
                          'Cancel Booking ?', 'Cancel')
                      .then((v) {
                    if (v!) {
                      controller.cancel(data['booking_id']);
                    }
                  });
                },
              ),

            if (isCancelled)
              _buildActionButton(
                "حذف",
                Colors.red,
                screenWidth,
                () {
                  AppValidations.showMessageBoxDelete(
                          'Delete Booking ?', 'Delete')
                      .then((v) {
                    if (v!) {
                      controller.delete(data['booking_id']);
                    }
                  });
                },
              ),
          ],
        ),
      ),
    );
  }

  // Reusable info row
  Widget _buildInfoRow(String label, String value, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "$label: ",
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.w600,
            fontSize: screenWidth * .01,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: value,
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w400,
                fontSize: screenWidth * .01,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable action button
  Widget _buildActionButton(
      String text, Color color, double screenWidth, VoidCallback onTap,
      {IconData? icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w400,
                fontSize: screenWidth * .01,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

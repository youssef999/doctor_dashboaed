import 'package:doctor/admin/controller/booking_controller.dart';
import 'package:doctor/core/resources/app_colors.dart';
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

  BookingController controller =Get.put(BookingController());
  @override
  void initState() {
    controller.getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('الحجوزات', context, false),
      body:GetBuilder<BookingController>(
        builder: (_) {
          return  GridView.builder(
            shrinkWrap: true,
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      BookingCard(
                        data: controller.data[index],
                        isCancelled: controller.data[index]['status']
                            == 'Refuse'
                      )
                    );
                }, gridDelegate: const
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,childAspectRatio:1.2
                )
              );
        }
      ),
    );
  }
}


class BookingCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final bool isCancelled;

  BookingCard({
    super.key,
    required this.data,
    this.isCancelled = false,
  });

  @override
  Widget build(BuildContext context) {
    BookingController controller =Get.put(BookingController());

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        // Responsive sizes
        double cardPadding = screenWidth > 600 ? 20 : 10;
        double fontSizeSmall = screenWidth > 600 ? 14 : 12;
        double fontSizeLarge = screenWidth > 600 ? 16 : 14;
        double imageRadius = screenWidth > 600 ? 50 : 38;
        double buttonWidth = screenWidth > 600 ? 120 : 90;

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 16, horizontal: cardPadding),
            padding: EdgeInsets.all(cardPadding),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "تاريخ الحجز : ${data['date']}",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w600,
                          fontSize: fontSizeSmall,
                          color: isCancelled
                              ? Colors.grey
                              : AppColors.whiteColor,
                        ),
                      ),
                      Text(
                        "وقت الحجز : ${data['time']}",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w600,
                          fontSize: fontSizeSmall,
                          color: isCancelled
                              ? Colors.grey
                              : AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // Doctor Info
                Text(
                  "بيانات الطبيب",
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w600,
                    fontSize: fontSizeLarge,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(data['image']),
                      radius: imageRadius,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow("الاسم", data['name'], fontSizeSmall),
                          _buildInfoRow("البريد الالكتروني", data['email'], fontSizeSmall),
                          _buildInfoRow("رقم الهاتف", data['phone'], fontSizeSmall),
                          _buildInfoRow("المؤهلات", data['qualifications'], 11),
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
                    fontSize: fontSizeLarge,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow("اسم المستخدم", data['user_name'], fontSizeSmall),
                    _buildInfoRow("بريد المستخدم", data['user_email'], fontSizeSmall),
                   // _buildInfoRow("هاتف المستخدم", data['user_phone'], fontSizeSmall),
                  ],
                ),
                const SizedBox(height: 10),
                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (!isCancelled)
                      _buildActionButton(
                        "الغاء الحجز",
                        Colors.red,
                        buttonWidth,
                            () => controller.cancel(data['booking_id']),
                      ),
                    // if (!isCancelled)
                    //   _buildActionButton(
                    //     "الخريطه",
                    //     AppColors.primaryBGLightColor,
                    //     buttonWidth,
                    //         () {},
                    //     icon: Icons.location_on_outlined,
                    //   ),
                    if (isCancelled)
                      _buildActionButton(
                        "حذف",
                        Colors.red,
                        buttonWidth,
                            () => controller.delete(data['booking_id']),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Reusable info row
  Widget _buildInfoRow(String label, String value, double fontSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: RichText(
        text: TextSpan(
          text: "$label: ",
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.w600,
            fontSize: fontSize,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: value,
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w400,
                fontSize: fontSize,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable action button
  Widget _buildActionButton(String text, Color color, double width, VoidCallback onTap, {IconData? icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
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
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Icon(
                  icon,
                  size: 15,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}






// class BookingCardWidget extends StatelessWidget {
//   final Map<String, dynamic> data;
//
//   BookingCardWidget({super.key, required this.data});
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         double screenWidth = constraints.maxWidth;
//
//         // Responsive sizes
//         double fontSize = screenWidth > 600 ? 20 : 16; // Adjust font size for larger screens
//         double imageHeight = screenWidth > 600 ? 150 : 100; // Adjust image size
//         double padding = screenWidth > 600 ? 16 : 8; // Adjust padding
//
//         return Directionality(
//           textDirection: TextDirection.rtl,
//           child: Container(
//             width: screenWidth > 600 ? 500 : double.infinity, // Limit width for web
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(13),
//               color: Colors.grey[100],
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.3),
//                   blurRadius: 5,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(padding),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Image
//                   Center(
//                     child: Image.asset(
//                       'assets/images/book.png',
//                       height: imageHeight,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   // User Name
//                   _buildInfoRow("اسم المستخدم", data['user_name'], fontSize),
//                   SizedBox(height: 6),
//                   // Email
//                   _buildInfoRow("البريد الالكتروني", data['user_email'], fontSize),
//                   SizedBox(height: 6),
//                   // Phone
//                   _buildInfoRow("رقم الهاتف", data['user_phone'], fontSize),
//                   SizedBox(height: 6),
//                   // Booking Type
//                   _buildInfoRow("نوع الحجز", data['type'], fontSize),
//                   SizedBox(height: 6),
//                   // Doctor Name
//                   _buildInfoRow("الطبيب", data['name'], fontSize),
//                   SizedBox(height: 6),
//                   // Doctor Phone
//                   _buildInfoRow("رقم هاتف الطبيب", data['phone'], fontSize),
//                   SizedBox(height: 6),
//                   // Booking Date
//                   _buildInfoRow("تاريخ الحجز", data['date'], fontSize),
//                   SizedBox(height: 6),
//                   // Booking Time
//                   _buildInfoRow("توقيت الحجز", data['time'], fontSize),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildInfoRow(String label, String value, double fontSize) {
//     return RichText(
//       text: TextSpan(
//         text: "$label: ",
//         style: GoogleFonts.cairo(
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//           fontSize: fontSize,
//         ),
//         children: [
//           TextSpan(
//             text: value,
//             style: GoogleFonts.cairo(
//               color: Colors.black,
//               fontWeight: FontWeight.normal,
//               fontSize: fontSize,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


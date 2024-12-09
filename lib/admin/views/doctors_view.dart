import 'package:doctor/admin/controller/doc_controller.dart';
import 'package:doctor/admin/views/doc_profile.dart';
import 'package:doctor/admin/widget/searchme.dart';
import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/core/resources/app_validations.dart';
import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/features/user/doctorUser/controller/doctor_controller.dart';
import 'package:doctor/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorsView extends StatefulWidget {
  const DoctorsView({super.key});

  @override
  State<DoctorsView> createState() => _DoctorsViewState();
}

class _DoctorsViewState extends State<DoctorsView> {
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  final DocController controller = Get.put(DocController());

  @override
  void initState() {
    controller.getDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar('الاطباء'.tr, context, true),
      backgroundColor: Colors.grey[200],
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            const SizedBox(height: 10),
            SearchMe(screenWidth: screenWidth, controller: controller),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(right: 10, left: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              width: screenWidth,
              height: 50,
              child: Expanded(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //  const SizedBox(width: 10),
                      Text(
                        "حذف ",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.cairo(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "سعر الكشف",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.cairo(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "القسم",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.cairo(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "رقم الهاتف ",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.cairo(
                          color: Colors.black,
                        ),
                      ),

                      Text(
                        "اسم الطبيب",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.cairo(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "صوره ",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.cairo(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GetBuilder<DocController>(builder: (_) {
              return SizedBox(
                height: screenHeight * .74,
                child: ListView.builder(
                  clipBehavior: Clip.antiAlias,
                  shrinkWrap: true,
                  itemCount: controller.doctorData.length,
                  itemBuilder: (context, index) {
                    return controller.doctorData[index]
                                .toString()
                                .toLowerCase()
                                .contains('${controller.search.value}') ||
                            controller.doctorData[index]
                                .toString()
                                .contains('${controller.search.value}')
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: buildDoctorCard(
                                data: controller.doctorData[index],
                                screenWidth: screenWidth
                                //    screenWidth: screenWidth,
                                ),
                          )
                        : SizedBox();
                  },
                  // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  //   maxCrossAxisExtent: screenWidth, // Max width per card
                  //   mainAxisSpacing: 10,
                  //   mainAxisExtent: 100,
                  //   crossAxisSpacing: 10,
                  //   //  childAspectRatio: screenWidth /400, // Maintain proper aspect ratio

                  //   //  childAspectRatio: screenWidth /400, // Maintain proper aspect ratio
                  // ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}



Widget buildDoctorCard(
    {required Map<String, dynamic> data, required double screenWidth
    // required double screenWidth,
    }) {
  Doctor doctor = Doctor.fromJson(data);
  DoctorController controller = Get.put(DoctorController());
  DocController docController = Get.put(DocController());
  controller.doctor.value = doctor;

  return GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 0.5,
          color: AppColors.greyColor.withOpacity(0.1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(data['image']),
            radius: 40, // Responsive image size
          ),
          Text(
            data['name'],
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.01, // Responsive font size
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            data['phone'],
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.01,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            data['cat'],
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.01,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '${data['price']} دينار',
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.w400,
              fontSize: screenWidth * 0.01,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                AppValidations.showMessageBoxDelete('Delete Doctor ?', 'Delete')
                    .then((v) {
                  if (v!) {
                    docController.deleteDoctor(int.parse(data['id']));
                  }
                });
              }),
        ],
      ),
    ),
    onTap: () {
      Get.to(DoctorAdminProfileView(data: data));
    },
  );
}

class UserCardWidget extends StatelessWidget {
  final DocController controller;
  final Map<String, dynamic> user;

  const UserCardWidget({
    super.key,
    required this.controller,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GetBuilder<DocController>(builder: (_) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.grey[100],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Image.network(
                  user['image'],
                  height: screenWidth * 0.2, // Responsive image size
                ),
                const SizedBox(height: 10),
                Text(
                  user['name'],
                  style: GoogleFonts.cairo(
                    color: Colors.black,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  user['email'],
                  style: GoogleFonts.cairo(
                    color: Colors.black,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  user['phone'],
                  style: GoogleFonts.cairo(
                    color: Colors.black,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ],
            ),
            onTap: () {},
          ),
        ),
      );
    });
  }
}

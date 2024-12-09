import 'package:doctor/admin/comp/comp_view.dart';
import 'package:doctor/admin/controller/admin_controller.dart';
import 'package:doctor/admin/views/doctors_view.dart';
import 'package:doctor/admin/views/users_view.dart';
import 'package:doctor/admin/widget/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/custom_app_bar.dart';
import '../../features/st/st_view.dart';
import 'bookings_view.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  AdminController controller = Get.put(AdminController());
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>(); // Unique Key
  @override
  void initState() {
    // controller.getData();
    //controller.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      key: formKey1,
      appBar: CustomAppBar('DashBoard', context, false),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: ListView(
          children: [
            const SizedBox(height: 21),
            Image.asset(
              'assets/images/logo.png',
              height: screenWidth * .1,
            ),
            const SizedBox(height: 21),
            SizedBox(
              child: GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 20),
                children: [
                  CustomButtonV(
                    text: 'الأطباء',
                    onPressed: () {
                      Get.to(() => DoctorsView());
                    },
                    img: 'assets/images/intro1.jpeg',
                  ),
                  CustomButtonV(
                    text: 'المستخدمين',
                    onPressed: () {
                      Get.to(() => UsersView());
                    },
                    img: 'assets/images/noChat.png',
                  ),
                  CustomButtonV(
                    text: 'الحجوزات',
                    onPressed: () {
                      Get.to(() => BookingsView());
                    },
                    img: 'assets/images/intro2.png',
                  ),
                  CustomButtonV(
                    text: 'الاحصاءات',
                    onPressed: () {
                      Get.to(() => StView());
                    },
                    img: 'assets/images/intro3.jpeg',
                  ),
                  // CustomButtonV(
                  //   text: 'الاعلي تقييما',
                  //   onPressed: () {
                  //     Get.to(TopDocView());
                  //   },
                  //   img: 'assets/images/otp.png',
                  // ),
                  CustomButtonV(
                    text: 'عرض الشكاوي',
                    onPressed: () {
                      Get.to(() => CompView());
                    },
                    img: 'assets/images/intro3.jpeg',
                  ),
                ],
              ),
            ),

            //TopDocView
          ],
        ),
      ),
    );
  }
}

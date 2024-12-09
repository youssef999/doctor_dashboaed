import 'package:doctor/admin/controller/user_controller.dart';
import 'package:doctor/core/widgets/Custom_button.dart';
import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>(); // Unique Key

  UserController controller = Get.put(UserController());
  @override
  void initState() {
    controller.getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('المستخدمين', context, true),
      body: GetBuilder<UserController>(builder: (_) {
        return GridView.builder(
            shrinkWrap: true,
            itemCount: controller.userData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: UserCardWidget(
                    controller: controller, user: controller.userData[index]),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 1, childAspectRatio: 1.7));
      }),
    );
  }
}

class UserCardWidget extends StatelessWidget {
  UserController controller;
  Map<String, dynamic> user;

  UserCardWidget({super.key, required this.controller, required this.user});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (_) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.grey[100]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Image.asset(
                    'assets/images/user2.png',
                    height: 100,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "اسم المستخدم : " + user['name'],
                    style: GoogleFonts.cairo(color: Colors.black, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "بريد المستخدم : " + user['email'],
                    style: GoogleFonts.cairo(color: Colors.black, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "رقم الهاتف المستخدم : " + user['phone'],
                    style: GoogleFonts.cairo(color: Colors.black, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 333,
                    child: CustomButton(
                        text: ' حذف المستخدم ',
                        onPressed: () {
                          controller.deleteUser(int.parse(user['id']));
                        }),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          onTap: () {
            controller.deleteUser(user['id']);
          },
        ),
      );
    });
  }
}

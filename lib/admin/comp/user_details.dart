import 'package:doctor/admin/controller/user_controller.dart';
import 'package:doctor/core/resources/app_validations.dart';
import 'package:doctor/core/widgets/Custom_button.dart';
import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class userDetailsView extends StatefulWidget {
  String id;
  userDetailsView({super.key, required this.id});

  @override
  State<userDetailsView> createState() => _userDetailsViewState();
}

class _userDetailsViewState extends State<userDetailsView> {
  UserController controller = Get.put(UserController());

  @override
  void initState() {
    controller.getUserId(int.parse(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar('', context, false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<UserController>(builder: (_) {
          if (controller.userDetails.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(21.0),
              child: UserCardWidget(
                  controller: controller, user: controller.userDetails[0]),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
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
            height: 322,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.grey[100]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(user['image'],

                        ),
                        radius: 50,
                      ),
                      SizedBox(width: 12,),
                      Text(
                      user['name'],
                        style: GoogleFonts.cairo(color: Colors.black, fontSize: 22,
                        fontWeight: FontWeight.w700
                        ),
                      ),
                    ],
                  ),
                  // Image.network(
                  //   user['image'],
                  //   height: 100,
                  // ),
                  const SizedBox(height: 10),

                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "بريد المستخدم : " + user['email'],
                        style: GoogleFonts.cairo(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "رقم الهاتف المستخدم : " + user['phone'],
                        style: GoogleFonts.cairo(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 333,
                    child: CustomButton(
                        text: ' حذف المستخدم ',
                        onPressed: () {
                          AppValidations.showMessageBoxDelete(
                                  'Delete User ?', 'Delete')
                              .then((v) {
                            if (v!) {
                              controller.deleteUser(int.parse(user['id']));
                            }
                          });
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

import 'package:doctor/admin/controller/user_controller.dart';
import 'package:doctor/admin/widget/searchme.dart';
import 'package:doctor/core/resources/app_validations.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar('المستخدمين', context, true),
      body: Column(
        children: [
          const SizedBox(height: 10),
          SearchMe(screenWidth: screenWidth, controller: controller),
          const SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            width: screenWidth,
            height: 50,
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10),
                  //  const SizedBox(width: 10),
                  Text(
                    "حذف ",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cairo(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "رقم الهاتف ",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cairo(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "بريد ",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cairo(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "اسم ",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cairo(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "صوره ",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cairo(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
          GetBuilder<UserController>(builder: (_) {
            return SizedBox(
              height: screenHeight * .74,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.userData.length,
                itemBuilder: (context, index) {
                  return controller.userData[index]
                              .toString()
                              .toLowerCase()
                              .contains('${controller.search.value}') ||
                          controller.userData[index]
                              .toString()
                              .contains('${controller.search.value}')
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: UserCardWidget(
                              screenWidth: screenWidth,
                              controller: controller,
                              user: controller.userData[index]),
                        )
                      : SizedBox();
                },
                // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                //   maxCrossAxisExtent: screenWidth, // Max width per card
                //   mainAxisSpacing: 10,
                //   mainAxisExtent: 100,
                //   crossAxisSpacing: 10,
                //   //  childAspectRatio: screenWidth /400, // Maintain proper aspect ratio
                // ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class UserCardWidget extends StatelessWidget {
  UserController controller;
  Map<String, dynamic> user;
  double screenWidth;
  UserCardWidget(
      {super.key,
      required this.controller,
      required this.user,
      required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (_) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.grey[100]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 10),
                  CircleAvatar(
                    backgroundImage: NetworkImage(user['image']),
                    radius: 40, // Responsive image size
                  ),
                  const SizedBox(width: 10),
                  Text(
                    user['name'],
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cairo(
                        color: Colors.black, fontSize: screenWidth * .01),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    user['email'],
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cairo(
                        color: Colors.black, fontSize: screenWidth * .01),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    user['phone'],
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cairo(
                        color: Colors.black, fontSize: screenWidth * .01),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        AppValidations.showMessageBoxDelete(
                                'Delete User ?', 'Delete')
                            .then((v) {
                          if (v!) {
                            controller.deleteUser(int.parse(user['id']));
                          }
                        });
                      }),
                  const SizedBox(width: 10),
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

import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/core/widgets/customHolder.dart';
import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/features/chats/controller/chats_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_routes.dart';

class ChatsView extends GetView<ChatsController> {
  const ChatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChatsController());
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: CustomAppBar('chat'.tr, context, false),
        body: Obx(
          () {
            return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: controller.count.value != 0
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {Get.toNamed(Routes.CHAT);},
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.s,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/doctor.jpeg'), // Replace with your asset image path
                                    radius: 38,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'دكتور  علي الياسري',
                                          style: GoogleFonts.cairo(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: const Color(0xFF000000),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة!',
                                          style: GoogleFonts.cairo(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10,
                                            color: AppColors.greyColor
                                                .withOpacity(0.4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'منذ ساعة',
                                        style: GoogleFonts.cairo(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: AppColors.greyColor
                                              .withOpacity(0.4),
                                        ),
                                      ),
                                      Text(
                                        '10:00 AM',
                                        style: GoogleFonts.cairo(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: AppColors.greyColor
                                              .withOpacity(0.4),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                        // Top Filters
                        ,
                        itemCount: 2,
                      )
                    : CustomHolder(
                        'لايوجد اي محدثة.؟', 'assets/images/noChat.png'));
          },
        ));
  }
}

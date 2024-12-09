import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/core/widgets/basicAppBar.dart';
import 'package:doctor/core/widgets/customHolder.dart';
import 'package:doctor/features/notification/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_routes.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: BasicAppBar('الاشعارات'.tr),
        body: Obx(
          () {
            return RefreshIndicator(
              onRefresh: () => controller
                  .getNotification(controller.users.value.userId ?? '0'),
              child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: controller.notification.isNotEmpty
                      ? ListView.builder(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.CHAT);
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 10, bottom: 20),
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            width: 1,
                                            color: AppColors.greyColor
                                                .withOpacity(.1)))),
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.s,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.greyColor
                                                  .withOpacity(.1))),
                                      child: SvgPicture.asset(
                                        'assets/icon/people.svg',
                                        // width: 20,
                                        //color: AppColors.primaryBGLightColor
                                        //  .withOpacity(.45),
                                      ),
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
                                            controller.notification[index]
                                                    .message ??
                                                '',
                                            style: GoogleFonts.cairo(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: const Color(0xFF000000),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة!',
                                            style: GoogleFonts.cairo(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              color: AppColors.greyColor,
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
                          itemCount: controller.notification.length,
                        )
                      : CustomHolder(
                          'لايوجد اي محدثة.؟', 'assets/images/noChat.png')),
            );
          },
        ));
  }
}

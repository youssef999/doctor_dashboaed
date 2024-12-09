import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/features/more/controller/more_controller.dart';
import 'package:doctor/features/settings/views/change_lang_view.dart';
import 'package:doctor/features/splash/intro.dart';
import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class MoreView extends GetView<MoreController> {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MoreController());
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: CustomAppBar('حسابي'.tr, context, true),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(() {
              return ListView(children: [
                // Top Filters
                Text(
                  'مرحبا بك ',
                  style: GoogleFonts.cairo(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                controller.roleId.value == '0'
                    ? ContainButton(
                        icon: Icons.timer_sharp,
                        name: 'منبه الادويه',
                        onTap: () {
                          Get.toNamed(Routes.ALERT);
                        },
                        isLog: false,
                      )
                    : ContainButton(
                        icon: Icons.calendar_today_rounded,
                        name: 'مواعيد عمل العيادهّ',
                        onTap: () {
                          Get.toNamed(Routes.SCHEDULE);
                        },
                        isLog: false,
                      ),
                ContainButton(
                  icon: Icons.person_outlined,
                  name: 'حسابي',
                  onTap: () {
                    Get.toNamed(Routes.PROFILE);
                  },
                  isLog: false,
                ),
                controller.roleId.value == '0'
                    ? ContainButton(
                        icon: Icons.bookmark,
                        name: 'العناصر المحفوظه',
                        onTap: () {
                          Get.toNamed(Routes.FAVORITE);
                        },
                        isLog: false,
                      )
                    : SizedBox(),
                controller.roleId.value == '1'
                    ? ContainButton(
                        icon: Icons.medical_information,
                        name: 'اعدادات العياده',
                        onTap: () {
                          Get.toNamed(Routes.CLINIC);
                        },
                        isLog: false,
                      )
                    : SizedBox(),
                controller.roleId.value != '0'
                    ? ContainButton(
                        icon: Icons.person_add_alt,
                        name: 'قائمه المرضي',
                        onTap: () {
                          Get.toNamed(Routes.PATIENTS);
                        },
                        isLog: false,
                      )
                    : const SizedBox(),
                ContainButton(
                  icon: Icons.language,
                  name: 'اللغه',
                  onTap: () {
                    Get.to(const ChangeLangView());
                  },
                  isLog: false,
                ),
                controller.roleId.value == '0'
                    ? ContainButton(
                        icon: Icons.star_border_rounded,
                        name: 'تقييم التطبيق',
                        isLog: false,
                        onTap: () {},
                      )
                    : ContainButton(
                        icon: Icons.star_purple500_sharp,
                        name: 'تقييمات الزائرين',
                        isLog: false,
                        onTap: () {
                          Get.toNamed(Routes.RATE);
                        },
                      ),
                ContainButton(
                  icon: Icons.question_mark_outlined,
                  name: 'اسئلتي',
                  onTap: () {},
                  isLog: false,
                ),
                ContainButton(
                  icon: Icons.share_outlined,
                  name: 'مشاركه التطبيق',
                  onTap: () async {
                    final box = context.findRenderObject() as RenderBox?;

                    await Share.shareUri(
                      Uri.parse('https://www.apple.com/store'),
                      sharePositionOrigin:
                          box!.localToGlobal(Offset.zero) & box.size,
                    );
                  },
                  isLog: false,
                ),
                // ContainButton(
                //   icon: Icons.settings,
                //   name: 'الاعدادات',
                //   onTap: () {},
                //   isLog: false,
                // ),
                // controller.roleId.value == '1'
                //     ? ContainButton(
                //         icon: Icons.settings,
                //         name: 'تسجيل دخول طبيب',
                //         onTap: () {},
                //         isLog: true,
                //       )
                //     : SizedBox(),
                GestureDetector(
                    onTap: () {
                      Get.offAll(IntroView());
                      final box = GetStorage();
                      box.remove('roleId');
                      box.remove("email");
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, right: 10, left: 20),
                      margin: const EdgeInsets.only(bottom: 7),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'تسجيل خروج',
                            style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: AppColors.whiteColor),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.logout,
                            textDirection: TextDirection.rtl,
                            size: 17,
                            color: AppColors.whiteColor,
                          ),
                        ],
                      ),
                    ))
              ]);
            })));
  }
}

// ignore: must_be_immutable
class ContainButton extends StatelessWidget {
  IconData icon;
  String name;
  void Function() onTap;
  bool isLog;
  ContainButton(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.name,
      required this.isLog});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, right: 10, left: 20),
        margin: const EdgeInsets.only(bottom: 7),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: AppColors.greyColor.withOpacity(.1)),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  isLog == false ? icon : Icons.medical_information_outlined,
                  size: 17,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                  style: GoogleFonts.cairo(
                      fontSize: 12,
                      color: isLog == false
                          ? AppColors.darkColor
                          : AppColors.primaryBGLightColor),
                ),
              ],
            ),
            isLog == false
                ? Icon(Icons.arrow_forward_ios,
                    size: 15, color: AppColors.greyColor.withOpacity(.3))
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

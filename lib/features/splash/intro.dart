// ignore_for_file: avoid_print

import 'package:doctor/features/settings/views/change_lang_view.dart';
import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/app_colors.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  _IntroViewState createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  final box = GetStorage();
  String? lang;

  @override
  void initState() {
    lang = box.read('locale') ?? 'ar';
    var x;
    x = box.read('roleId');
    print('ROOOOOLEEE $x');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(backgroundColor: AppColors.whiteColor, actions: [
        Row(
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => Get.to(const ChangeLangView()),
              child: Container(
                width: 40,
                height: 40,
                // padding: EdgeInsets.all(5),
                margin: const EdgeInsets.only(right: 20, left: 20),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 220, 220, 220)),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    lang == 'ar' ? 'AR' : 'EN',
                    style: GoogleFonts.cairo(
                        color: AppColors.primaryBGLightColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 300,
            child: Image.asset(
              'assets/images/intro.png',
              fit: BoxFit.cover,
              // width: 10,
              //  scale: 10,
              // fit: BoxFit.cover,
              //  width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ButtonLogin(
            onPressed: () {
              box.write('roleId', '1');
              Get.toNamed(Routes.LOGIN);
            },
            name: 'login'.tr,
            backColor: AppColors.whiteColor,
            frontColor: AppColors.primaryBGLightColor,
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonLogin(
            onPressed: () {
              box.write('roleId', '0');
              Get.toNamed(Routes.ROOT);
            },
            name: 'احجز الان'.tr,
            backColor: AppColors.primaryBGLightColor,
            frontColor: AppColors.whiteColor,
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonLogin(
            onPressed: () {
              box.write('roleId', '2');
              Get.toNamed(Routes.LOGIN);
            },
            name: 'تسجيل كدكتور'.tr,
            backColor: AppColors.whiteColor,
            frontColor: AppColors.primaryBGLightColor,
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonLogin(
            onPressed: () {
              box.write('roleId', '3');
              Get.toNamed(Routes.LOGIN);
            },
            name: 'تسجيل كمندوب'.tr,
            backColor: AppColors.whiteColor,
            frontColor: AppColors.primaryBGLightColor,
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ButtonLogin extends StatelessWidget {
  void Function()? onPressed;
  String name;
  Color backColor;
  Color frontColor;
  ButtonLogin(
      {super.key,
      this.onPressed,
      required this.name,
      required this.backColor,
      required this.frontColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 60, left: 60),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            fixedSize: const Size(300, 60),
            shadowColor: AppColors.darkColor,
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    width: 1.5,
                    color: const Color.fromARGB(255, 220, 220, 220)),
                borderRadius: BorderRadius.circular(8)),
            backgroundColor: backColor),
        onPressed: onPressed,
        child: Text(
          name,
          style: GoogleFonts.cairo(
              color: frontColor, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

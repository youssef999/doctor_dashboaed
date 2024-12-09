import 'package:doctor/core/resources/app_assets.dart';
import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/features/splash/intro.dart';
import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final box = GetStorage();
  @override
  void initState() {
    //bool isOpen = box.read('isOpen') ?? false;
    String email = box.read('email') ?? 'x';

   // String roleId=box.read('roleId')??'0';

   // if(roleId=='x'){
    Future.delayed(const Duration(seconds: 3)).then((value) {

      if(email=='x'){
          //Get.toNamed(Routes.ROOT);
        Get.off(const IntroView());
      }else{
         Get.toNamed(Routes.ROOT);
      }
      // isOpen == true
      //     ? email == 'x'
      //         ? Get.off(const IntroView())
      //         : Get.toNamed(Routes.ROOT)
      //     : Get.to(OnboardingScreen());
    });
   // }

    // if(roleId=='0'){
    //   Get.offAllNamed(Routes.ROOT);

    // }


    // if(roleId=='1'){
    //     Get.offAllNamed(Routes.ROOT);
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: double.infinity,
              // clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                // borderRadius: BorderRadius.circular(25)
              ),
              child: Image.asset(
                AppAssets.logo,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // SizedBox(
          //   width: 200,
          //   height: 100,
          //   child: DefaultGoogleFonts.cairo(
          //     style: GoogleFonts.cairo(fontSize: 23.0, color: Colors.white),
          //     child: AnimatedTextKit(
          //       totalRepeatCount: 1,
          //       // pause: Duration(minutes: 1),
          //       animatedTexts: [
          //         RotateAnimatedText('Welcome to\n Real State',
          //             textAlign: TextAlign.center,
          //             duration: const Duration(seconds: 3)),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

// ignore_for_file: avoid_print

import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/features/user/favorite/controller/favorite_controller.dart';
import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/app_colors.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar('العناصر المحفوظه'.tr, context, false),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _buildDoctorCard(
                  name: 'دكتور علي الياسري',
                  specialty: 'اختصاصي طب الفم وأسان وجراحة وتقويم الاسنان',
                  rating: 5.5,
                  imageUrl: 'assets/images/doctor1.png',
                  price: 300,
                  location: 'العراق، محافظة البصرة، الى الصحة',
                );
             

            },
            itemCount: 2,
          ),
        ],
      ),
    );
  }
  Widget _buildDoctorCard({
    required String name,
    required String specialty,
    required double rating,
    required String imageUrl,
    required int price,
    required String location,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(width: .5, color: AppColors.greyColor.withOpacity(0.1)),
        bottom:
            BorderSide(width: .5, color: AppColors.greyColor.withOpacity(0.1)),
      )),
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/user.png',
                ),
                radius: 40,
              ),
              GestureDetector(
                onTap: (){Get..toNamed(Routes.RESERVE);},
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: AppColors.primaryBGLightColor,
                      borderRadius: BorderRadius.circular(3)),
                  child: Center(
                    child: Text(
                      'احجز الان',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(
                          color: AppColors.whiteColor, fontSize: 12),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              Text(
                specialty,
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w400,
                  fontSize: 8,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 14),
                  Text(
                    rating.toString(),
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Text(
                'سعر الكشف $price دينار',
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              Text(
                location,
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

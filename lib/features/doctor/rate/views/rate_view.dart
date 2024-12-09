// ignore_for_file: avoid_print

import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/features/doctor/rate/controllers/rate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/app_colors.dart';

class RateView extends GetView<RateController> {
  const RateView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RateController());
    return Scaffold(
        backgroundColor: AppColors.mainlyZ,
        appBar: CustomAppBar('rate'.tr, context, false),
        body: ListView.builder(
          shrinkWrap: true,
          // scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return _buildReviewCard(
                name: 'لطفي الحايك',
                review:
                    'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد',
                imageUrl: 'assets/images/user.png',
                rate: 4);
          },
          itemCount: 2,
        ));
  }

  Widget _buildReviewCard(
      {required String name,
      required String review,
      required String imageUrl,
      required double rate}) {
    return Container(
      height: 100,

      //width: 230,
      margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 15),
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 20),
      //height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
              width: .7, color: AppColors.greyColor.withOpacity(.2))),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
              radius: 25,
            ),
            
            SizedBox(
              width: 140,
              //height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Expanded(
                    child: Text(
                      review,
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w400,
                        fontSize: 9,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate((rate.round()), (index) {
                return const Icon(
                  Icons.star_rate_rounded,
                  color: Color.fromARGB(255, 255, 197, 36),
                  size: 23,
                );
              }),
            ),
          ]),
    );
  }
}

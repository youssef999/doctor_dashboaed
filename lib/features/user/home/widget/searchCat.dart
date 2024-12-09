import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class SearchFilterCategory extends GetView<HomeController> {
  const SearchFilterCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar('بحث',context,false),
      body: Obx(() {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(
                  Routes.DOCTOR,
                  arguments: {'doctor': controller.x[index]},
                );
              },
              child: _buildDoctorCard(
                name: controller.x[index].name ?? 'name',
                specialty: controller.x[index].qualification ?? 'qualification',
                rating: controller.x[index].rate ?? 0,
                imageUrl: controller.x[index].image ??
                    'https://images.pexels.com/photos/5215024/pexels-photo-5215024.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                price: controller.x[index].price ?? 0,
                location: 'العراق، محافظة البصرة، الى الصحة',
              ),
            );
          },
          itemCount: controller.x.length,
        );
      }),
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
              CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
                radius: 40,
              ),
              GestureDetector(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.bookmark_border,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

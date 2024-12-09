import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/core/resources/app_strings.dart';
import 'package:doctor/core/widgets/adv.dart';
import 'package:doctor/features/user/home/widget/filter.dart';
import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Get.toNamed(Routes.NOTIFICATION);
            },
          ),
        ],
        leadingWidth: 200,
        leading: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/user.png',
                ),
                radius: 30,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.users.value.name ?? '',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'العراق، صلاح الدين',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) async {
                    await controller.getSearch(value);
                    if (value.isEmpty) {
                      controller.search.length = 0;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'ابحث بالتخصص، اسم الدكتور او العيادة',
                    hintStyle: GoogleFonts.cairo(
                        fontSize: 12,
                        color: AppColors.greyColor.withOpacity(.4)),
                    prefixIconConstraints:
                        const BoxConstraints.expand(width: 30, height: 30),
                    prefixIcon: SvgPicture.asset(
                      'assets/icon/icon-search.svg',
                      color: AppColors.greyColor.withOpacity(.4),
                    ),
                    // prefixIconColor: AppColors.greyColor.withOpacity(.3),
                    suffixIcon: IconButton(
                      // padding: EdgeInsets.zero,
                      icon: const Icon(Icons.filter_list_outlined),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => DraggableScrollableSheet(
                            initialChildSize: 0.6,
                            minChildSize: 0.4,
                            maxChildSize: 0.8,
                            expand: false,
                            builder: (context, scrollController) {
                              return PopupView(
                                  scrollController: scrollController);
                            },
                          ),
                        );
                      },
                    ),
                    contentPadding:
                        const EdgeInsets.only(top: 10, right: 10, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.greyColor.withOpacity(0.1),
                            width: 3)),
                  ),
                ),
                Obx(() {
                  return controller.y.isNotEmpty
                      ? Container(
                          height: 230,
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: AppColors.greyColor.withOpacity(.1)),
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return buildSearch(
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.DOCTOR,
                                      arguments: {
                                        'doctor': controller.y[index]
                                      },
                                    );
                                  },
                                  name: controller.y[index].name ?? '',
                                  specialty:
                                      controller.y[index].qualification ?? '',
                                  rating: controller.y[index].rate ?? 0,
                                  imageUrl: controller.y[index].image ?? '',
                                  price: controller.y[index].price ?? 0,
                                  location: controller.y[index].address ?? '');
                            },
                            itemCount: controller.y.length,
                          ),
                        )
                      : const SizedBox.shrink();
                })
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: AdvWidget(),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20),
            child: Text(
              'التخصصات',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                SizedBox(
                  width: 400,
                  child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0),
                    children: [
                      _buildSpecialtyCard('اسنان', 'assets/images/teeth.png'),
                      _buildSpecialtyCard(
                          'نساء وتوليد', 'assets/images/preg.png'),
                      _buildSpecialtyCard('اطفال', 'assets/images/baby.png'),
                      _buildSpecialtyCard('عظام', 'assets/images/leg.png'),
                      _buildSpecialtyCard('عيون', 'assets/images/eye.png'),
                      _buildSpecialtyCard('قلب', 'assets/images/heart.png'),
                      _buildSpecialtyCard(
                          'العصابية', 'assets/images/brain.png'),
                      _buildSpecialtyCard('باطنة', 'assets/images/kidny.png'),
                    ],
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0),
                    children: [
                      _buildSpecialtyCard('اورام', 'assets/images/cancer.png'),
                      _buildSpecialtyCard('تغذية', 'assets/images/fat.png'),
                      _buildSpecialtyCard(
                          'انف و اذن', 'assets/images/nose.png'),
                      _buildSpecialtyCard('كبد', 'assets/images/liver.png'),
                      _buildSpecialtyCard(
                          'جراحة عامة', 'assets/images/surgery.png'),
                      _buildSpecialtyCard(
                          'علاج طبيعي', 'assets/images/natural.png'),
                      _buildSpecialtyCard(
                          'معامل تحاليل', 'assets/images/diagnose.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Container(
                // width: 220,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(right: 20, left: 20),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.5, color: AppColors.greyColor.withOpacity(.2)),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'الأطباء القريبين منك',
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: AppColors.primaryBGLightColor,
                      ),
                    ),
                    const Icon(
                      Icons.location_on_sharp,
                      color: AppColors.primaryBGLightColor,
                      size: 18,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Obx(() {
            Ui.logSuccess('FAX FAX ${controller.doctor}');
            return controller.doctor.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            Routes.DOCTOR,
                            arguments: {'doctor': controller.doctor[index]},
                          );
                        },
                        child: _buildDoctorCard(
                          name: controller.doctor[index].name ?? 'name',
                          specialty: controller.doctor[index].qualification ??
                              'qualification',
                          rating: controller.doctor[index].rate ?? 0,
                          imageUrl: controller.doctor[index].image ??
                              'https://images.pexels.com/photos/5215024/pexels-photo-5215024.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                          price: controller.doctor[index].price ?? 0,
                          location: 'العراق، محافظة البصرة، الى الصحة',
                        ),
                      );
                    },
                    itemCount: controller.doctor.length <= 3
                        ? controller.doctor.length
                        : 3,
                  )
                : Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            border: Border(
                          top: BorderSide(
                              width: .5,
                              color: AppColors.greyColor.withOpacity(0.1)),
                          bottom: BorderSide(
                              width: .5,
                              color: AppColors.greyColor.withOpacity(0.1)),
                        )),
                        height: 150,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/loading.gif',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            border: Border(
                          top: BorderSide(
                              width: .5,
                              color: AppColors.greyColor.withOpacity(0.1)),
                          bottom: BorderSide(
                              width: .5,
                              color: AppColors.greyColor.withOpacity(0.1)),
                        )),
                        height: 150,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/loading.gif',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  );
          }),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Text(
              'اراء و التعليقات',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            width: 250,
            child: Obx(() {
              return controller.comments.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildReviewCard(
                            name: controller.comments[index].name ?? '',
                            review: controller.comments[index].comment ?? '',
                            imageUrl: controller.comments[index].image ??
                                'assets/images/user.png',
                            rate: controller.comments[index].rate ?? 0);
                      },
                      itemCount: controller.comments.length,
                    )
                  : ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                            width: 250,
                            margin: const EdgeInsets.only(
                                bottom: 15, left: 10, right: 15),
                            padding: const EdgeInsets.all(10),
                            //height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: .7,
                                    color:
                                        AppColors.greyColor.withOpacity(.1))),
                            child: Image.asset(
                              'assets/images/loading.gif',
                              fit: BoxFit.cover,
                            )),
                        Container(
                            width: 300,
                            margin: const EdgeInsets.only(
                                bottom: 15, left: 10, right: 15),
                            padding: const EdgeInsets.all(10),
                            //height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: .7,
                                    color:
                                        AppColors.greyColor.withOpacity(.1))),
                            child: Image.asset(
                              'assets/images/loading.gif',
                              fit: BoxFit.cover,
                            ))
                      ],
                    );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialtyCard(String title, String iconPath) {
    return GestureDetector(
      onTap: () {
        controller.getCats(title);
      },
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, height: 40),
            const SizedBox(height: 5),
            Text(
              title,
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ],
        ),
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

  Widget buildSearch({
    required String name,
    required String specialty,
    required double rating,
    required void Function()? onTap,
    required String imageUrl,
    required int price,
    required String location,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border(
              top: BorderSide(
                  width: .5, color: AppColors.greyColor.withOpacity(0.1)),
              bottom: BorderSide(
                  width: .5, color: AppColors.greyColor.withOpacity(0.1)),
            )),
        height: 110,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                imageUrl,
              ),
              radius: 40,
            ),
            //  const SizedBox(width: 10),
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
      ),
    );
  }

  Widget _buildReviewCard(
      {required String name,
      required String review,
      required String imageUrl,
      required double rate}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15, left: 10, right: 15),
      padding: const EdgeInsets.all(10),
      //height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: .7, color: AppColors.greyColor.withOpacity(.1))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        const SizedBox(
          width: 15,
        ),
        SizedBox(
          width: 180,
          //height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              Row(
                children: List.generate((rate.round()), (index) {
                  return const Icon(
                    Icons.star_rate_rounded,
                    color: Colors.orangeAccent,
                    size: 18,
                  );
                }),
              ),
              Text(
                review,
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w400,
                  fontSize: 8,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

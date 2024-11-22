import 'package:doctor/features/user/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import '../resources/app_colors.dart';

class AdvWidget extends StatelessWidget {
  const AdvWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return SizedBox(
      height: 222,
      child: Obx(() {
        return ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              SizedBox(
                height: 210,
                child: CarouselSlider.builder(
                  unlimitedMode: true,
                  controller: controller.sliderController,
                  slideBuilder: (index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                      child: Container(
                        height: 333,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: controller.colors[index],
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                controller.adsList.isNotEmpty
                                    ? controller.adsList[index]['image']
                                    : '',
                              ),
                            )),
                      ),
                    );
                  },
                  slideTransform: const DepthTransform(),
                  slideIndicator: CircularWaveSlideIndicator(
                    padding: const EdgeInsets.only(bottom: 15),
                    indicatorBorderWidth: 60,
                    currentIndicatorColor: AppColors.primaryBGLightColor,
                    indicatorBackgroundColor:
                        const Color.fromARGB(255, 234, 234, 234),
                  ),
                  itemCount: controller.adsList.isNotEmpty
                      ? controller.adsList.length
                      : 1,
                  initialPage: 0,
                  enableAutoSlider: true,
                ),
              )
            ]);
      }),
    );
  }
}

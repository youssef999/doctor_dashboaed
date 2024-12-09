import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/features/user/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class PopupView extends StatelessWidget {
  final ScrollController scrollController;
  final HomeController controller = Get.put(HomeController());

  PopupView({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              ListTile(
                title: Center(
                  child: Text(
                    'حدد بحثك',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: const Color(0xFF000000),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: AppColors.greyColor.withOpacity(.2),
                ),
              ),
              _buildToggleButtons(
                  'التخصصات الفرعية',
                  [
                    'الكل',
                    'اسنان بالغين',
                    'اسنان اطفال',
                    'اسنان مسنين',
                  ],
                  controller.selectedSpeciality,
                  controller.second_cat),
              _buildToggleButtons(
                  'المنشأة',
                  [
                    'الكل',
                    'مستشفى',
                    'عيادة',
                    'محادثة',
                  ],
                  controller.selectedFacility,
                  controller.build),
              _buildPriceSlider(),
              _buildToggleButtons(
                  'المواعيد المتاحة',
                  [
                    'أي يوم',
                    'اليوم',
                    'غدا',
                  ],
                  controller.selectedDate,
                  controller.second_cat),
              _buildToggleButtons(
                  'النوع',
                  [
                    'الكل',
                    'دكتور',
                    'دكتورة',
                  ],
                  controller.selectedGender,

                  controller.gender),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    print(controller.gender.value);
                    controller.filterDoctors(
                        controller.second_cat.value,
                        controller.price.value,
                        controller.build.value,
                        controller.gender.value,context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: const Color(0xFF04CE00),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: Text(
                    'البحث',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButtons(String title, List<String> options,
      RxString selectedOption, RxString text) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, top: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: const Color(0xFF000000),
            ),
          ),
          const SizedBox(height: 20),
          Obx(() {
            return SizedBox(
              height: 40,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: options.map((option) {
                  return Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: ChoiceChip(
                      label: Text(
                        option,
                        style: GoogleFonts.cairo(),
                      ),
                      selected: selectedOption.value == option,
                      onSelected: (isSelected) {
                        if (isSelected) {
                          selectedOption.value = option;
                          text.value = option;
                       
                        }
                      },
                      
                      side: BorderSide(
                          color: AppColors.primaryBGLightColor.withOpacity(.3)),
                      selectedColor: AppColors.primaryLightColor,
                      showCheckmark: false,
                      //shape:LinearBorder(),
                      backgroundColor: Colors.white,
                      labelPadding: EdgeInsets.only(left: 15, right: 15),
                      labelStyle: GoogleFonts.cairo(
                        color: selectedOption.value == option
                            ? AppColors.whiteColor
                            : Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildPriceSlider() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'سعر الكشف',
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: const Color(0xFF000000),
            ),
          ),
          const SizedBox(height: 8),
          Obx(() {
            return FlutterSlider(
              values: [controller.minPrice.value, controller.maxPrice.value],
              rangeSlider: true,
              max: 500,
              min: 100,
              trackBar: FlutterSliderTrackBar(
                  activeTrackBarHeight: 6,
                  activeTrackBar: const BoxDecoration(
                      color: Color.fromRGBO(127, 228, 126, 1)),
                  inactiveTrackBar:
                      BoxDecoration(color: AppColors.greyColor.withOpacity(.2)),
                  inactiveTrackBarHeight: 2
                  // activeDisabledTrackBarColor: AppColors.primaryBGLightColor,
                  //  inactiveDisabledTrackBarColor: AppColors.darkColor

                  ),

              step: const FlutterSliderStep(step: 10),
              onDragging: (handlerIndex, lowerValue, upperValue) {
                controller.minPrice.value = lowerValue;
                controller.maxPrice.value = upperValue;
                controller.price.value = controller.maxPrice.value;
              },
              //foregroundDecoration: BoxDecoration(color: AppColors.darkColor),
              handler: FlutterSliderHandler(
                decoration: const BoxDecoration(),
                child: Material(
                  type: MaterialType.circle,
                  color: AppColors.primaryBGLightColor,
                  elevation: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: const Icon(
                      Icons.circle,
                      color: AppColors.primaryBGLightColor,
                      size: 12,
                    ),
                  ),
                ),
              ),
              rightHandler: FlutterSliderHandler(
                decoration: const BoxDecoration(),
                child: Material(
                  type: MaterialType.circle,
                  color: AppColors.primaryBGLightColor,
                  elevation: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: const Icon(
                      Icons.circle,
                      color: AppColors.primaryBGLightColor,
                      size: 12,
                    ),
                  ),
                ),
              ),
              tooltip: FlutterSliderTooltip(
                leftPrefix: const Icon(
                  Icons.attach_money,
                  size: 19,
                  color: Colors.black45,
                ),
                rightSuffix: const Icon(
                  Icons.attach_money,
                  size: 19,
                  color: Colors.black45,
                ),
                textStyle: GoogleFonts.cairo(fontSize: 17, color: Colors.black45),
              ),

              hatchMark: FlutterSliderHatchMark(
                density: 0.5,
                labels: [
                  FlutterSliderHatchMarkLabel(
                      percent: 0,
                      label: Text(
                        '100 IQD',
                        style: GoogleFonts.cairo(),
                      )),
                  FlutterSliderHatchMarkLabel(
                      percent: 100,
                      label: Text('500 IQD', style: GoogleFonts.cairo())),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

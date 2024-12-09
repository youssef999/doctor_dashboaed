import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/core/resources/app_strings.dart';
import 'package:doctor/models/comment_model.dart';
import 'package:doctor/models/doctor_model.dart';
import 'package:doctor/models/search_model.dart';
import 'package:doctor/models/user_model.dart';
import 'package:doctor/repositories/category_storage.dart';
import 'package:doctor/repositories/user_storage.dart';
import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeController extends GetxController {
  RxList sliderImagesList = [].obs;
  CarouselSliderController sliderController = CarouselSliderController();

  late UserRepository userRepository;
  late CategoryRepository categoryRepository;
  RxString second_cat = "اسنان اطفال".obs;
  RxDouble price = 500.0.obs;
  RxString build = "مستشفي".obs;
  RxString gender = "دكتور".obs;
  RxList<Doctor> doctor = <Doctor>[].obs;
  RxList<Doctor> filterDoctor = <Doctor>[].obs;
  RxList<Search> search = <Search>[].obs;
  RxList<Comments> comments = <Comments>[].obs;
  Rx<Users> users = Users().obs;

  HomeController() {
    userRepository = UserRepository();
    categoryRepository = CategoryRepository();
  }

  @override
  void onInit() async {
    await myAds();
    try {
      final box = GetStorage();
      users.value =
          Users.fromJson(box.read('current_user') ?? <String, dynamic>{});
      Ui.logError('banm111111 ${users.value}');
    } catch (e) {
      print(e);
    }

    // Doctor();
    await getDoctors();
    await getComments();
    super.onInit();
  }

  final RxList<Color> colors = [
    AppColors.whiteColor,
    AppColors.whiteColor,
    AppColors.whiteColor,
    AppColors.whiteColor,
    AppColors.whiteColor,
    AppColors.whiteColor,
  ].obs;
  late RxList adsList = [].obs;

  var selectedSpeciality = 'الكل'.obs;
  var selectedFacility = 'الكل'.obs;
  var selectedDate = 'أي يوم'.obs;
  var selectedGender = 'الكل'.obs;
  var minPrice = 100.0.obs;
  var maxPrice = 500.0.obs;

  Future<void> myAds() async {
    // print("BUILDINGSSSSS................");
    try {
      // Ui.logSuccess('this meeeee ${id}');
      adsList.value = await categoryRepository.myAds();

      Ui.logError('q12x ${adsList}');
    } catch (e) {
      print('ahoooo $e');
    }
  }

  Future<void> filterDoctors(String second_cat, double price, String build,
      String gender, BuildContext context) async {
    try {
      List<Doctor> x =
          await userRepository.filterDoctors(second_cat, price, build, gender);
      Get.back();
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.8,
          expand: false,
          builder: (context, scrollController) {
            return GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    child: ListView(controller: scrollController, children: [
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
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                Routes.DOCTOR,
                                arguments: {'doctor': x[index]},
                              );
                            },
                            child: _buildDoctorCard(
                              name: x[index].name ?? 'name',
                              specialty:
                                  x[index].qualification ?? 'qualification',
                              rating: x[index].rate ?? 0,
                              imageUrl: x[index].image ??
                                  'https://images.pexels.com/photos/5215024/pexels-photo-5215024.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                              price: x[index].price ?? 0,
                              location: 'العراق، محافظة البصرة، الى الصحة',
                            ),
                          );
                        },
                        itemCount: x.length <= 3 ? x.length : 3,
                      )
                    ])));
          },
        ),
      );
      Ui.logError('q12x ${filterDoctor}');
    } catch (e) {
      print('ahoooo $e');
    }
  }

  Future<void> getDoctors() async {
    print("BUILDINGSSSSS................");
    try {
      //CustomLoading.showLoading('Loading');
      Ui.logSuccess('starting Doctorssss');

      doctor.assignAll(await userRepository.getDoctors());
      Ui.logSuccess('zxxc ${doctor}');
      //CustomLoading.cancelLoading();
    } catch (e) {
      Ui.logError('FAX FAX ERROR $e');
    }
  }

  RxList<Doctor> x = <Doctor>[].obs;
  Future<void> getCats(String cat) async {
    print("BUILDINGSSSSS................");
    try {
      //CustomLoading.showLoading('Loading');
      Ui.logSuccess('starting Doctorssss');
      x.value =  await userRepository.searchByCat(cat);
      Get.toNamed(Routes.CATFILTER);
      Ui.logSuccess('CAT SEARCH ${x}');
      //CustomLoading.cancelLoading();
    } catch (e) {
      Ui.logError('FAX FAX ERROR $e');
    }
  }
  RxList<Doctor> y = <Doctor>[].obs;

  Future<void> getSearch(String doc) async {
    print("BUILDINGSSSSS................");
    try {
      //CustomLoading.showLoading('Loading');
      Ui.logSuccess('starting Doctorssss');

      y.value =await userRepository.search(doc);
      Ui.logSuccess('zxxc ${y}');
      //CustomLoading.cancelLoading();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getComments() async {
    print("COmments................");
    try {
      //CustomLoading.showLoading('Loading');
      Ui.logSuccess('starting COmments');

      comments.assignAll(await userRepository.getComments());
      //CustomLoading.cancelLoading();
    } catch (e) {
      print(e);
    }
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

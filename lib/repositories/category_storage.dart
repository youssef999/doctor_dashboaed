import 'package:get/get.dart';

import '../network/laravel.dart';

class CategoryRepository {
  late LaravelApiClient laravelApiClient;

  CategoryRepository() {
    laravelApiClient = Get.find<LaravelApiClient>();
  }



  // Future<List<Building>> myBuildings(String userId) {
  //   laravelApiClient = Get.find<LaravelApiClient>();
  //   return laravelApiClient.myBuildings(userId);
  // }

  // Future<List<Building>> buildingSearch(String currentItemValue,
  //     String locationName, String currentCalValue, String currentTypeValue) {
  //   laravelApiClient = Get.find<LaravelApiClient>();
  //   return laravelApiClient.buildingSearch(
  //       currentItemValue, locationName, currentCalValue, currentTypeValue);
  // }

  Future myAds() {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.getAds();
  }

  // Future<bool> deleteBuild(String id) {
  //   laravelApiClient = Get.find<LaravelApiClient>();
  //   return laravelApiClient.deleteBuild(id);
  // }
}

import 'package:doctor/features/doctor/rate/controllers/rate_controller.dart';
import 'package:get/get.dart';


class RateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RateController>(
      () => RateController(),
    );
  }
}
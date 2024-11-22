import 'package:doctor/features/driver/home/controllers/homeDriver_controller.dart';
import 'package:get/get.dart';


class HomeDriverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeDriverController>(
      () => HomeDriverController(),
    );
  }
}
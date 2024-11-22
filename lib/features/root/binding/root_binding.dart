import 'package:get/get.dart';
import 'package:doctor/features/root/controller/root_controller.dart';


class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );
 
  }
}
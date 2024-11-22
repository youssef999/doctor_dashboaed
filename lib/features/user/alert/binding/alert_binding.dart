import 'package:doctor/features/user/alert/controller/alert_controller.dart';
import 'package:get/get.dart';

class AlertBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlertController>(
      () => AlertController(),
    );
  }
}

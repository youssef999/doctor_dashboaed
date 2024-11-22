
import 'package:doctor/core/resources/app_strings.dart';
import 'package:doctor/models/notification.dart';
import 'package:doctor/models/user_model.dart';
import 'package:doctor/repositories/user_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NotificationController extends GetxController {

Rx<int> count = 2.obs;
  Rx<Users> users = Users().obs;
  RxList<Notifications> notification = <Notifications>[].obs;

  late UserRepository userRepository;

  NotificationController() {
    userRepository = UserRepository();
  }
  @override
  void onInit() async{
        try {
      final box = GetStorage();
      users.value =
          Users.fromJson(box.read('current_user') ?? <String, dynamic>{});
      Ui.logError('banm111111 ${users.value}');
      await getNotification(users.value.userId ?? '0');
    } catch (e) {
      print(e);
    }
    super.onInit();

  }
  
  Future<void> getNotification(String id) async {
    print("BUILDINGSSSSS................");
    try {
      //CustomLoading.showLoading('Loading');
      Ui.logSuccess('starting Notificationsss');
      notification.assignAll(await userRepository.getNotification(id));
      Ui.logSuccess('zxxc ${notification}');
      //CustomLoading.cancelLoading();
    } catch (e) {
      Ui.logError('FAX FAX ERROR $e');
    }
  } 

}


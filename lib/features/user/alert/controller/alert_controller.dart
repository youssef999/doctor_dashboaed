import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertController extends GetxController {
  final medicineNameController = TextEditingController();
  var selectedTime = TimeOfDay.now().obs;
  var selectedQuantity = ''.obs;
  int id = 1;
  Future<void> scheduleAlarm(TimeOfDay time, String medicineName) async {
    final now = DateTime.now();
    var alarmTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    if (alarmTime.isBefore(now)) {
      // If the alarm time is before the current time, set it for the next day
      alarmTime = alarmTime.add(const Duration(days: 1));
    }

    final alarmSettings = AlarmSettings(
      id: id,
      dateTime: alarmTime,
      assetAudioPath: 'assets/audios/alarm.mp3',
      loopAudio: true,
      vibrate: true,
      fadeDuration: 3.0,
      volume: 1,
      notificationTitle: 'Medicine Reminder',
      notificationBody: 'Time to take your medicine: $medicineName',
      enableNotificationOnKill: true,
    );

    await Alarm.set(alarmSettings: alarmSettings);

    Get.snackbar('Success',
        'Alarm has been set for ${selectedTime.value.format(Get.context!)}',
        snackPosition: SnackPosition.BOTTOM);
  }

  void setAlarm() {
    final medicineName = medicineNameController.text;
    if (medicineName.isNotEmpty && selectedQuantity.value.isNotEmpty) {
      id = id + 1;
      scheduleAlarm(selectedTime.value, medicineName);
      print(id);
    } else {
      Get.snackbar('Error', 'Please fill all fields',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void stopAlarm() async {
    await Alarm.stop(id); // Stopping the alarm with ID 42
    Get.snackbar('Alarm Stopped', 'The alarm has been stopped.',
        snackPosition: SnackPosition.BOTTOM);
  }
}

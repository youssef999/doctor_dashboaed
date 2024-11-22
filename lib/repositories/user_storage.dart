import 'package:doctor/models/booking_model.dart';
import 'package:doctor/models/clinics.dart';
import 'package:doctor/models/comment_model.dart';
import 'package:doctor/models/doctor_model.dart';
import 'package:doctor/models/notification.dart';
import 'package:doctor/models/search_model.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../network/laravel.dart';

class UserRepository {
  late LaravelApiClient laravelApiClient;

  Future<Users> login(Users user) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.login(user);
  }

  Future<Doctor> loginDoctor(Doctor doctor) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.loginDoctor(doctor);
  }

  Future<List<Doctor>> getDoctors() {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.getDoctors();
  }

  Future<List<Booking>> getUsersAppoint(int id) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.getUsersAppoint(id);
  }

  Future<List<Notifications>> getNotification(String id) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.notification(id);
  }

  Future<List<Doctor>> filterDoctors(
      String second_cat, double price, String build, String gender) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.filterDoctors(second_cat, price, build, gender);
  }

  Future<List<Booking>> getBooking(String id) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.getBooking(id);
  }

  Future<bool> addBooking(Booking book) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.addBooking(book);
  }

  Future<bool> editBooking(Booking book) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.editBooking(book);
  }

  Future<List<Doctor>> search(String doc) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.search(doc);
  }

  Future<List<Comments>> docComments(Doctor doc) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.doctorComments(doc);
  }

  Future<List<Comments>> getComments() {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.getComments();
  }

  Future<Users> me(Users user) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.me(user);
  }

  Future<Clinics> getClinics(String id) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.getClinic(id);
  }

  Future<List<Doctor>> searchByCat(String doc) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.searchByCat(doc);
  }

  Future<bool> removeBooking(String id) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.removeBooking(id);
  }

  Future<bool> editClinic(Clinics clinics) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.editClinic(clinics);
  }

  Future<bool> editProfileDoctor(Doctor doctor) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.editProfileDoctor(doctor);
  }

  Future<bool> editProfile(Users users) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.editProfile(users);
  }

//searchByCat
//editClinic
//editProfileDoctor

  // Future<bool> updateUser(Users user) {
  //   laravelApiClient = Get.find<LaravelApiClient>();
  //   return laravelApiClient.updateUser(user);
  // }

  //   Future<bool> deleteUser(String userId) {
  //   laravelApiClient = Get.find<LaravelApiClient>();
  //   return laravelApiClient.deleteUser(userId);
  // }
  // Future<Users> get(Users user) {
  //   laravelApiClient = Get.find<LaravelApiClient>();
  //   return laravelApiClient.getUsers(user);
  // }
  Future<bool> registerDoctor(Doctor doctor) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.registerDoctor(doctor);
  }

  Future<bool> register(Users users) {
    laravelApiClient = Get.find<LaravelApiClient>();
    return laravelApiClient.register(users);
  }
}

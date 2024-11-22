import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:doctor/core/resources/app_strings.dart';
import 'package:doctor/models/booking_model.dart';
import 'package:doctor/models/clinics.dart';
import 'package:doctor/models/comment_model.dart';
import 'package:doctor/models/doctor_model.dart';
import 'package:doctor/models/notification.dart';
import 'package:doctor/models/search_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/user_model.dart';
import 'providers.dart';

class LaravelApiClient extends GetxService with ApiClient {
  LaravelApiClient();
  ApiClient? apiClient;
  Future<LaravelApiClient> init() async {
    Get.lazyPut(() => Users());
    apiClient;
    return this;
  }

  final authService = Users();

  // Future<Users> getUsers(Users user) async {
  //   Uri uri = getApiBaseUri("me");
  //   Get.log(uri.toString());
  //   var response = await _httpClient.getUri(uri,
  //       options: Options(headers: {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'X-Requested-With': 'XMLHttpRequest',
  //         'Accept-Language': 'en',
  //         'Authorization': 'Bearer ${authService.apiToken}'
  //       }));
  //   if (response.data['data'] != null) {
  //     return Users.fromJson(response.data['data']);
  //   } else {
  //     throw Exception(response.data['message']);
  //   }
  // }

  Future<Users> login(Users user) async {
    print("LOGIN");
    print(basicUrl);
    //print('LOGIN==='+);
    String uri = getApiBaseUri("auth/login.php");
    Get.log(uri.toString());
    Ui.logError('123 $user');
    try {
      var request = await Dio().post(uri,
          options: Options(
            headers: {
             // 'Content-Type': 'application/json',
              'Authorization': basicUrl,

              // 'Authorization': 'Bearer $token'
            },
          ),
          data: json
              .encode({'phone': user.phoneNumber, 'password': user.password}));

      var responseBody = jsonDecode(request.data);
      if (responseBody['success'] == true) {
        return Users.fromJson(responseBody['data']);
      } else {
        print(responseBody.toString());

        Get.showSnackbar(Ui.ErrorSnackBar(message: 'Wrong Email or Password'));
        throw Exception(responseBody['message']);
      }
    } catch (e) {
      print("EEEE-==="+e.toString());
      Ui.logError('qqaazz  skslk $e');
      throw Exception('Error');
    }
  }

  Future<Doctor> loginDoctor(Doctor doctor) async {
    print("LOGIN");
    print(basicUrl);
    //print('LOGIN==='+);
    String uri = getApiBaseUri("doc/login.php");
    Get.log(uri.toString());
    Ui.logError('123 $doctor');
    try {
      var request = await Dio().post(uri,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': basicUrl,
              // 'Authorization': 'Bearer $token'
            },
          ),
          data: json.encode(
              {'phone': doctor.phoneNumber, 'password': doctor.password}));

      var responseBody = jsonDecode(request.data);
      if (responseBody['success'] == true) {
        return Doctor.fromJson(responseBody['data']);
      } else {
        print(responseBody.toString());

        Get.showSnackbar(Ui.ErrorSnackBar(message: 'Wrong Email or Password'));
        throw Exception(responseBody['message']);
      }
    } catch (e) {
      Ui.logError('qqaazz  skslk $e');
      throw Exception('Error');
    }
  }

  Future<bool> register(Users user) async {
    String uri = getApiBaseUri("auth/register.php");
    Get.log(uri.toString());
    Ui.logError(json.encode(user));
    try {
      var request = await Dio().post(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': basicUrl,
            // 'Authorization': 'Bearer $token'
          }),
          //    body: json.encode({user}));
          data: json.encode(user));
      var responseBody = jsonDecode(request.data);
      if (responseBody['success'] == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      Ui.logSuccess(e);
      return false;
    }
  }

  Future<bool> registerDoctor(Doctor doctor) async {
    String uri = getApiBaseUri("doc/register.php");
    Get.log(uri.toString());
    Ui.logError(json.encode(doctor));
    try {
      var request = await Dio().post(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': basicUrl,
            // 'Authorization': 'Bearer $token'
          }),
          data: json.encode({
            "name": doctor.name,
            "phone": doctor.phoneNumber,
            "email": doctor.email,
            "password": doctor.password,
            "cat": doctor.cat,
            "second_cat": doctor.secoundCat,
            "price": doctor.price,
            "image": doctor.image,
            "lat": doctor.lat,
            "lng": doctor.lng,
            "exp_years": doctor.expYear,
            "details": doctor.details,
            "qualifications": doctor.qualification,
            "degree": doctor.degree,
            "building": doctor.clinikName,
            "gender": doctor.gender,
            "rate": "0",
          }));
      var responseBody = jsonDecode(request.data);
      if (responseBody['success'] == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      Ui.logSuccess(e);
      return false;
    }
  }

  Future<bool> editProfile(Users user) async {
    print("Edit Users");
    print(basicUrl);
    //print('LOGIN==='+);
    String uri = getApiBaseUri("profile/edit_profile.php");
    Get.log(uri.toString());
    Ui.logError('123 $user');
    try {
      var request = await Dio().post(uri,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': basicUrl,
            },
          ),
          data: json.encode({
            "name": user.name,
            "email": user.email,
            "password": user.email,
            "phone": user.phoneNumber,
            "id": user.userId
          }));
      var responseBody = jsonDecode(request.data);
      if (responseBody['success'] == true) {
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Successful'));
        return true;
      } else {
        print(responseBody.toString());
        Get.showSnackbar(Ui.ErrorSnackBar(message: 'Wrong Data'));
        return false;
      }
    } catch (e) {
      Ui.logError('Edit Users $e');
      throw Exception('Error');
    }
  }

  Future<bool> editProfileDoctor(Doctor doctor) async {
    print("Edit Doctor");
    print(basicUrl);
    //print('LOGIN==='+);
    String uri = getApiBaseUri("doc/edit_doctor_data.php");
    Get.log(uri.toString());
    Ui.logError('123 $doctor');
    try {
      var request = await Dio().post(uri,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': basicUrl,
              // 'Authorization': 'Bearer $token'
            },
          ),
          data: json.encode({
            "id": doctor.id,
            "name": doctor.name,
            "phone": doctor.phoneNumber,
            "email": doctor.email,
            "cat": doctor.cat,
            "price": doctor.price
          }));
      var responseBody = jsonDecode(request.data);
      if (responseBody['success'] == true) {
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Successful'));
        return true;
      } else {
        print(responseBody.toString());

        Get.showSnackbar(Ui.ErrorSnackBar(message: 'Wrong Data'));
        return false;
      }
    } catch (e) {
      Ui.logError('Edit Doctor $e');
      throw Exception('Error');
    }
  }

  Future<bool> editClinic(Clinics clinic) async {
    print("Edit Clinic");
    print(basicUrl);
    //print('LOGIN==='+);
    String uri = getApiBaseUri("doctors/insert_clinck.php");
    Get.log(uri.toString());
    Ui.logError('123 $clinic');
    try {
      var request = await Dio().post(uri,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': basicUrl,
            },
          ),
          data: json.encode({
            "phone": clinic.phone,
            "clinck_name": clinic.clinckName,
            "price": clinic.price,
            "assistant_phone": clinic.assistantPhone,
            "assistant_name": clinic.assistantName,
            "doctor_id": clinic.doctorId,
            "image": clinic.image,
            "txt": clinic.txt,
            "address": clinic.address
          }));
      var responseBody = jsonDecode(request.data);
      if (responseBody['success'] == true) {
        Get.showSnackbar(Ui.ErrorSnackBar(message: 'Successful'));
        return true;
      } else {
        print(responseBody.toString());

        Get.showSnackbar(Ui.ErrorSnackBar(message: 'Wrong Data'));
        return false;
      }
    } catch (e) {
      Ui.logError('Edit Clinic $e');
      throw Exception('Error');
    }
  }

  Future<Users> me(Users users) async {
    String uri = getApiBaseUri("doctors/me.php");
    Get.log(uri.toString());
    //Ui.logError('the user id is (${id})');
    try {
      var request = await Dio().post(uri,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': basicUrl,
              // 'Authorization': 'Bearer $token'
            },
          ),
          data: json.encode({
            'token': users.token,
          }));
      var responseBody = jsonDecode(request.data);
      if (responseBody['success'] == true) {
        return Users.fromJson(responseBody['data']);
      } else {
        return Ui.logError('wrong credits');
      }
    } catch (e) {
      Ui.logSuccess(e);
      return Ui.logError('Contact Support');
    }
  }

  Future<Clinics> getClinic(String id) async {
    String uri = getApiBaseUri("doctors/get_click.php");
    Get.log(uri.toString());
    //Ui.logError('the user id is (${id})');
    try {
      var request = await Dio().get(uri,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': basicUrl,
            },
          ),
          data: json.encode({'doctor_id': id}));
      var responseBody = jsonDecode(request.data);
      if (responseBody['success'] == true) {
        return Clinics.fromJson(responseBody['data']);
      } else {
        return Ui.logError('Contact Support');
      }
    } catch (e) {
      Ui.logSuccess(e);
      return Ui.logError('Contact Support');
    }
  }

  Future<List<Booking>> getUsersAppoint(int id) async {

    print("ID==="+id.toString());
    String uri = getApiBaseUri("doc/get_users_booked.php");
    Get.log(uri.toString());
    //Ui.logError('the user id is (${id})');
    try {
      var request = await Dio().post(uri,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': basicUrl,
              // 'Authorization': 'Bearer $token'
            },
          ),
          //    body: json.encode({user}));
          data: json.encode({"doctor_id": id}));
      var responseBody = jsonDecode(request.data);
      if (responseBody['success'] == true) {
        print('zxxc ${responseBody['data']}');
        return responseBody['data']
            .map<Booking>((obj) => Booking.fromJson(obj))
            .toList();
      } else {
        return Ui.logError('wrong credits');
      }
    } catch (e) {
      Ui.logSuccess(e);
      return Ui.logError('Contact Support');
    }
  }

  Future getAds() async {
    String uri = getApiBaseUri("doctors/ads.php");
    Get.log(uri.toString());
    try {
      var request = await Dio().get(uri,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': basicUrl,
            },
          ));
      var responseBody = jsonDecode(request.data);
      if (responseBody['success'] == true) {
        return responseBody['data'];
      } else {
        return Ui.logError('wrong credits');
      }
    } catch (e) {
      Ui.logSuccess(e);
      return Ui.logError('Contact Support');
    }
  }

  Future<List<Doctor>> getDoctors() async {
    // print("GET BUILDINGS API HERE... $basicUrl");
    var uri = getApiBaseUri("doctors/get_doctors.php");
    Get.log(uri.toString());

    var request = await Dio().post(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': basicUrl,
            // 'Authorization': 'Bearer $token'
          },
        ),
        data: {"lat": "30.1219", "lng": "31.4056"});

    var responseBody = jsonDecode(request.data);
    if (request.statusCode == 200) {
      Ui.logError('VAXMAX ${responseBody['data']}');
      return responseBody['data']
          .map<Doctor>((obj) => Doctor.fromJson(obj))
          .toList();
    } else {
      print('errrrrrrrrrrrrrr');
      Ui.logError(responseBody['success']);
      throw Exception(responseBody['message']);
    }
  }

  Future<List<Comments>> doctorComments(Doctor doc) async {
    // print("GET BUILDINGS API HERE... $basicUrl");
    var uri = getApiBaseUri("doctors/get_doctor_comments.php");
    Get.log(uri.toString());

    var request = await Dio().get(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': basicUrl,
            // 'Authorization': 'Bearer $token'
          },
        ),
        data: {"doctor_id": doc.docId});

    var responseBody = jsonDecode(request.data);
    if (request.statusCode == 200) {
      return responseBody['data']
          .map<Comments>((obj) => Comments.fromJson(obj))
          .toList();
    } else {
      print('errrrrrrrrrrrrrr');
      Ui.logError(responseBody['success']);
      throw Exception(responseBody['message']);
    }
  }

  Future<List<Doctor>> search(String doc) async {
    // print("GET BUILDINGS API HERE... $basicUrl");
    var uri = getApiBaseUri("doctors/search.php");
    Get.log(uri.toString());

    var request = await Dio().get(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': basicUrl,
            // 'Authorization': 'Bearer $token'
          },
        ),
        data: {"name": doc});

    var responseBody = jsonDecode(request.data);
    print('BAAAAD1');
    if (request.statusCode == 200) {
      print('${responseBody['data']}');

      return responseBody['data']
          .map<Doctor>((obj) => Doctor.fromJson(obj))
          .toList();
    } else {
      print('BAAAAD3');

      print('errrrrrrrrrrrrrr');
      Ui.logError(responseBody['success']);
      throw Exception(responseBody['message']);
    }
  }

  Future<List<Comments>> getComments() async {
    // print("GET BUILDINGS API HERE... $basicUrl");
    var uri = getApiBaseUri("doctors/comments.php");
    Get.log(uri.toString());

    var request = await Dio().get(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': basicUrl,
            // 'Authorization': 'Bearer $token'
          },
        ));
    // data: {"lat": "30.1219", "lng": "31.4056"});

    var responseBody = jsonDecode(request.data);
    if (request.statusCode == 200) {
      return responseBody['data']
          .map<Comments>((obj) => Comments.fromJson(obj))
          .toList();
    } else {
      print('errrrrrrrrrrrrrr');
      Ui.logError(responseBody['success']);
      throw Exception(responseBody['message']);
    }
  }

  Future<List<Booking>> getBooking(String id) async {
    var uri = getApiBaseUri("doctors/get_booking.php");
    Get.log(uri.toString());
    var request = await Dio().post(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': basicUrl,
          },
        ),
        data: {"user_id": id});
    var responseBody = jsonDecode(request.data);
    if (request.statusCode == 200) {
      final box = GetStorage();
      box.write('booking', responseBody['data']);
      return responseBody['data']
          .map<Booking>((obj) => Booking.fromJson(obj))
          .toList();
    } else {
      print('errrrrrrrrrrrrrr');
      Ui.logError(responseBody['success']);
      throw Exception(responseBody['message']);
    }
  }

  Future<List<Doctor>> searchByCat(String doc) async {
    // print("GET BUILDINGS API HERE... $basicUrl");
    var uri = getApiBaseUri("doc/get_doc_cat.php");
    Get.log(uri.toString());
    Ui.logError('cat search ${doc}');

    var request = await Dio().get(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': basicUrl,
            // 'Authorization': 'Bearer $token'
          },
        ),
        data: {"cat": doc});

    var responseBody = jsonDecode(request.data);
    if (request.statusCode == 200) {
      Ui.logError('cat search ${responseBody['body']}');
      return responseBody['data']
          .map<Doctor>((obj) => Doctor.fromJson(obj))
          .toList();
    } else {
      print('errrrrrrrrrrrrrr');
      Ui.logError(responseBody['success']);
      throw Exception(responseBody['message']);
    }
  }

  Future<List<Doctor>> filterDoctors(
      String second_cat, double price, String build, String gender) async {
    // print("GET BUILDINGS API HERE... $basicUrl");
    var uri = getApiBaseUri("doctors/filter_doctors.php");
    Get.log(uri.toString());
    print("FILTERRRRRRRRR................");
    print("FILTERRRRRRRRR................${second_cat}");
    print("FILTERRRRRRRRR................${price}");
    print("FILTERRRRRRRRR................${build}");
    print("FILTERRRRRRRRR................${gender}");
    var request = await Dio().post(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': basicUrl,
            // 'Authorization': 'Bearer $token'
          },
        ),
        data: {
          "second_cat": second_cat,
          "price": price,
          "building": build,
          "gender": gender
        });

    var responseBody = jsonDecode(request.data);
    if (request.statusCode == 200) {
      Ui.logSuccess('VBNM ZXC ${responseBody['data']}');
      return responseBody['data']
          .map<Doctor>((obj) => Doctor.fromJson(obj))
          .toList();
    } else {
      print('errrrrrrrrrrrrrr');
      Ui.logError(responseBody['success']);
      throw Exception(responseBody['message']);
    }
  }

  Future<List<Notifications>> notification(String userId) async {
    // print("GET BUILDINGS API HERE... $basicUrl");
    var uri = getApiBaseUri("doctors/noti.php");
    Get.log(uri.toString());

    var request = await Dio().post(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': basicUrl,
            // 'Authorization': 'Bearer $token'
          },
        ),
        data: {
          "user_id": '1',
        });

    var responseBody = jsonDecode(request.data);
    if (request.statusCode == 200) {
      return responseBody['data']
          .map<Notifications>((obj) => Notifications.fromJson(obj))
          .toList();
    } else {
      print('errrrrrrrrrrrrrr');
      Ui.logError(responseBody['success']);
      throw Exception(responseBody['message']);
    }
  }

  Future<bool> addBooking(Booking book) async {
    // print("GET BUILDINGS API HERE... $basicUrl");
    var uri = getApiBaseUri("doctors/booking.php");
    Get.log(uri.toString());

    var request = await Dio().post(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': basicUrl,
            // 'Authorization': 'Bearer $token'
          },
        ),
        data: {
          "doctor_id": book.doctorId,
          "date": book.date,
          "user_id": book.userId,
          "user_name": book.name,
          "user_email": book.email,
          "msg": book.msg
        });

    var responseBody = jsonDecode(request.data);
    if (request.statusCode == 200) {
      return true;
    } else {
      print('errrrrrrrrrrrrrr');
      Ui.logError(responseBody['success']);
      return false;
    }
  }

  Future<bool> editBooking(Booking book) async {
    // print("GET BUILDINGS API HERE... $basicUrl");
    var uri = getApiBaseUri("doctors/edit_booking.php");
    Get.log(uri.toString());
    Ui.logError('vvvvvvvxxxxxxxx ${book.id}');
    var request = await Dio().post(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': basicUrl,
            // 'Authorization': 'Bearer $token'
          },
        ),
        data: {
          "booking_id": book.id,
          "date": book.date,
          "user_name": book.name,
          "msg": book.msg
        });

    var responseBody = jsonDecode(request.data);
    if (request.statusCode == 200) {
      return true;
    } else {
      print('errrrrrrrrrrrrrr');
      Ui.logError(responseBody['success']);
      return false;
    }
  }

  Future<bool> removeBooking(String id) async {
    String uri = getApiBaseUri("doctors/cancel_booking.php");
    Get.log(uri.toString());
    // Ui.logError(json.encode(doctor));
    try {
      var request = await Dio().post(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': basicUrl,
          }),
          data: json.encode({
            "booking_id": id,
          }));
      var responseBody = jsonDecode(request.data);
      if (responseBody['success'] == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      Ui.logSuccess(e);
      return false;
    }
  }

  // Future<List<Building>> buildingSearch(
  //     String currentItemValue,
  //     String locationName,
  //     String currentCalValue,
  //     String currentTypeValue) async {
  //   String uri = getApiBaseUri("buildings/building_search.php");
  //   //("buildings/get_buildings.php");
  //   Get.log(uri.toString());

  //   var request = await http.post(uri,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': basicUrl,
  //       },
  //       body: json.encode({
  //         "item": currentItemValue,
  //         "location_country": locationName,
  //         "cat": currentCalValue,
  //         "type": currentTypeValue
  //       }));
  //   var responseBody = jsonDecode(request.body);
  //   print("STATUS CODE==========${request.statusCode}");
  //   print("bodyyyy==========${request.body}");
  //   // String bodyData=request.body;

  //   if (request.statusCode == 200) {
  //
  //     return responseBody['data']
  //         .map<Building>((obj) => Building.fromJson(obj))
  //         .toList();
  //   } else {
  //     Ui.logError(responseBody['success']);
  //     throw Exception(responseBody['message']);
  //   }
  // }

  // Future<bool> deleteUser(String id) async {
  //   Uri uri = getApiBaseUri("auth/delete_user.php");
  //   Get.log(uri.toString());
  //   try {
  //     var request = await http.post(uri,
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'Authorization': basicUrl,
  //           // 'Authorization': 'Bearer $token'
  //         },
  //         //    body: json.encode({user}));
  //         body: json.encode({
  //           // 'user_id': id,
  //         }));
  //     //        Ui.logError('the user id is (${baseUrl})');

  //     var responseBody = jsonDecode(request.body);
  //     if (responseBody['success'] == true) {
  //
  //       return true;
  //     } else {
  //
  //       return false;
  //     }
  //   } catch (e) {
  //     Ui.logSuccess(e);
  //     return Ui.logError('Contact Support');
  //   }
  // }

  // Future<bool> deleteBuild(String id) async {
  //   Uri uri = getApiBaseUri("buildings/delete_building.php");
  //   Get.log(uri.toString());
  //   //  Ui.logError('the user id is (${id})');
  //   try {
  //     var request = await http.post(uri,
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'Authorization': basicUrl,
  //           // 'Authorization': 'Bearer $token'
  //         },
  //         //    body: json.encode({user}));
  //         body: json.encode({
  //           'id': id,
  //         }));
  //     var responseBody = jsonDecode(request.body);
  //     if (responseBody['success'] == true) {
  //
  //       return true;
  //     } else {
  //
  //       return false;
  //     }
  //   } catch (e) {
  //     Ui.logSuccess(e);
  //     return Ui.logError('Contact Support');
  //   }
  // }

  // Future<List<Building>> myBuildings(String userId) async {
  //   print("GET BUILDINGS API HERE... $basicUrl");
  //   Uri uri = getApiBaseUri("buildings/get_user_buildings.php");
  //   //("buildings/get_buildings.php");
  //   Get.log(uri.toString());
  //   //Ui.logError(build);
  //   var request = await http.post(uri,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': basicUrl,
  //         //   'Authorization': 'Bearer $token'
  //       },
  //       // String basicUrl='Basic '+base64Encode(utf8
  //       //     .encode('doctorApp:doctorApp2024'));
  //       //
  //       //
  //       // 'Authorization':basicUrl,
  //       body: json.encode({"user_id": userId})
  //       //    body: json.encode({user}));
  //       //   body: json.encode({build})
  //       );
  //   var responseBody = jsonDecode(request.body);
  //   if (request.statusCode == 200) {
  //
  //     return responseBody['data']
  //         .map<Building>((obj) => Building.fromJson(obj))
  //         .toList();
  //   } else {
  //     Ui.logError(responseBody['success']);
  //     throw Exception(responseBody['message']);
  //   }
  // }
  // Future<bool> verifyEmail(Users user) async {
  //   Uri uri = getApiBaseUri("confirm/email");
  //   Get.log(uri.toString());
  //   try {
  //     var response = await _httpClient.postUri(uri,
  //         data: {'email': user.email, 'verification_code': user.verify},
  //         options: Options(headers: {
  //           'Content-Type': 'application/json; charset=UTF-8',
  //           'X-Requested-With': 'XMLHttpRequest',
  //           'Accept-Language': 'en',
  //           'Authorization': 'Bearer ${authService.apiToken}'
  //         }));
  //     if (response.data['message'] == 'Email Confirmed') {
  //       return true;
  //     } else if (response.data['message'] ==
  //         'This code is not correct or expire') {
  //       return false;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // Future<bool> sendResetLinkEmail(Users user) async {
  //   Uri uri = getApiBaseUri("forget/password");
  //   Get.log(uri.toString());
  //   // to remove other attributes from the user object
  //   user = Users(email: user.email);
  //   var response = await _httpClient.postUri(
  //     uri,
  //     data: json.encode(user.toJson()),
  //     options: _optionsNetwork,
  //   );
  //   if (response.data['message'] ==
  //       'please check your email to set your  password') {
  //     return true;
  //   } else {
  //     throw Exception(response.data['message']);
  //   }
  // }

  // Future<Users> updateUsers(Users user) async {
  //   Uri uri = getApiBaseUri("account/update");
  //   Get.log(uri.toString());
  //   try {
  //     var response = await _httpClient.postUri(uri,
  //         options: Options(headers: {
  //           'Content-Type': 'application/json; charset=UTF-8',
  //           'X-Requested-With': 'XMLHttpRequest',
  //           'Accept-Language': 'en',
  //           'Authorization': 'Bearer ${authService.apiToken}'
  //         }));

  //     if (response.data['data'] != null) {
  //       response.data['data']['auth'] = true;
  //       return Users.fromJson(response.data['data']);
  //     } else {
  //       throw Exception(response.data['message']);
  //     }
  //   } catch (error) {
  //     throw Exception("Error uploading image: $error");
  //   }
  // }
}

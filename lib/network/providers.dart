/*
 * File name: api_provider.dart
 * Last modified: 2022.02.14 at 12:25:29
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */

import 'package:doctor/network/trace.dart';
import 'package:get/get.dart';

mixin ApiClient {

  
  String basicUrl =
      'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ=';

  String getApiBaseUri(String path) {

    return 'https://easy-systems.net/doctors/$path';
   // return Uri.parse('https://10.0.2.2/brokers/$path');
  }

  Uri getApiBaseUriT(String path) {
    return Uri.parse('https://easy-systems.net/doctors/$path');
   // return Uri.parse('https://DOCTORq8.org/brokers/$path');
  }

  Uri getBaseUri(String path) {
    return Uri.parse('https://easy-systems.net/doctors/$path');
   // return Uri.parse('https://DOCTORq8.org/brokers/$path');
  }

  void printUri(StackTrace stackTrace, Uri uri) {
    Get.log(CustomTrace(stackTrace, message: uri.toString()).toString());
  }
}

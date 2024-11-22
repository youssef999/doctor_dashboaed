import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';

import 'parent/model.dart';

class Doctor extends Model {
  String? docId;
  String? name;
  String? email;
  String? verify;
  String? license;
  String? birth;
  String? password;
  String? confirm;
  String? image;
  int? price;
  String? apiToken;
  String? deviceToken;
  String? clinikName;
  String? gender;
  String? phoneNumber;
  String? lat;
  String? lng;
  int? waitingTime;
  var expYear;
  String? details;
  var secoundCat;
  var cat;

  String? degree;

  double? rate;

  String? roleId;
  bool? verifiedPhone;
  String? verificationId;
  String? genderId;
  String? token;
  int? carType;
  String? address;
  String? qualification;
  bool? auth;

  Doctor(
      {this.name,
      this.email,
      this.password,
      this.docId,
      this.birth,
      this.rate,
      this.clinikName,
      this.gender,
      this.waitingTime,
      this.expYear,
      this.details,
      this.secoundCat,
      this.lat,
      this.lng,
      this.degree,
      this.cat,
      this.apiToken,
      this.verify,
      this.token,
      this.confirm,
      this.price,
      this.deviceToken,
      this.carType,
      this.genderId,
      this.roleId,
      this.license,
      this.phoneNumber,
      this.verifiedPhone,
      this.verificationId,
      this.address,
      this.qualification,
      this.image});

  Doctor.fromJson(Map<String, dynamic> json) {
    name = jsonToStr(json, 'name');
    email = jsonToStr(json, 'email');
    apiToken = jsonToStr(json, 'api_token');
    deviceToken = jsonToStr(json, 'fcsToken');
    token = jsonToStr(json, 'token');
    birth = jsonToStr(json, 'birth');
    genderId = jsonToStr(json, 'gender');
    docId = jsonToStr(json, 'id');
    carType = jsonToInt(json, 'car_id');
    verify = jsonToStr(json, 'verification_code');
    rate = jsonToDouble(json, 'rate');
    cat = jsonToStr(json, 'cat');
    lng = jsonToStr(json, 'lng');
    lat = jsonToStr(json, 'lat');
    gender = jsonToStr(json, 'gender');
    clinikName = jsonToStr(json, 'building');

    // waitingTime = jsonToInt(json, 'waiting_time');
    expYear = json['exp_years'];
    details = jsonToStr(json, 'details');
    // secoundCat = jsonToList(json, 'second_cat');
    secoundCat = json['second_cat'];
    degree = jsonToStr(json, 'degree');
    price = jsonToInt(json, 'price');
    phoneNumber = jsonToStr(json, 'phone');
    password = jsonToStr(json, 'pass');
    confirm = jsonToStr(json, 'password_confirmation');
    verifiedPhone = jsonToBool(json, 'phone_verified_at');
    image = jsonToStr(json, 'image');
    roleId = jsonToStr(json, 'role_id');

    auth = jsonToBool(json, 'auth');
    try {
      address = json['user_information']['address'];
    } catch (e) {
      address = jsonToStr(json, 'address');
    }

    qualification = json['qualifications'];

    super.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['user_email'] = email;
    data['token'] = token;
    data['id'] = docId;
    data['cat'] = cat;
    data['lat'] = lat;
    data['lng'] = lng;
    data['building'] = clinikName;
    data['gender'] = gender;

    data['waiting_time'] = waitingTime;
    data['exp_years'] = expYear;
    data['details'] = details;
    data['second_cat'] = secoundCat;
    data['degree'] = degree;

    data['rate'] = rate;
    data['price'] = price;
    if (password != null && password != '') {
      data['pass'] = password;
    }
    if (confirm == password && password != null && password != '') {
      data['password_confirmation'] = confirm;
    }
    data['verification_code'] = verify;
    data['api_token'] = apiToken;
    if (deviceToken != null) {
      data["fcsToken"] = deviceToken;
    }
    data['car_license'] = license;
    if (verifiedPhone != null && verifiedPhone!) {
      data["phone_verified_at"] = DateTime.now().toLocal().toString();
    }
    data["address"] = address;
    data["role_id"] = roleId;
    data["birth"] = birth;
    data['gender'] = genderId;
    data['car_id'] = carType;
    data['phone'] = phoneNumber;
    data["qualifications"] = qualification;

    data["image"] = image;

    data['auth'] = auth;
    return data;
  }

  PhoneNumber getPhoneNumber() {
    if (phoneNumber?.isEmpty == false) {
      try {
        phoneNumber = phoneNumber!.replaceAll(' ', '');
        String dialCode1 = phoneNumber!.substring(1, 2);
        String dialCode2 = phoneNumber!.substring(1, 3);
        String dialCode3 = phoneNumber!.substring(1, 4);
        for (int i = 0; i < countries.length; i++) {
          if (countries[i].dialCode == dialCode1) {
            return PhoneNumber(
                countryISOCode: countries[i].code,
                countryCode: dialCode1,
                number: phoneNumber!.substring(2));
          } else if (countries[i].dialCode == dialCode2) {
            return PhoneNumber(
                countryISOCode: countries[i].code,
                countryCode: dialCode2,
                number: phoneNumber!.substring(3));
          } else if (countries[i].dialCode == dialCode3) {
            return PhoneNumber(
                countryISOCode: countries[i].code,
                countryCode: dialCode3,
                number: phoneNumber!.substring(4));
          }
        }
      } catch (e) {
        print(e);
      }
    }
    return PhoneNumber(countryISOCode: "AE", countryCode: '1', number: '');
  }

  @override
  // ignore: non_nullable_equals_parameter
  bool operator ==(dynamic other) =>
      super == other &&
      other is Doctor &&
      runtimeType == other.runtimeType &&
      name == other.name &&
      cat == other.cat &&
      email == other.email &&
      token == other.token &&
      genderId == other.genderId &&
      carType == other.carType &&
      birth == other.birth &&
      rate == other.rate &&
      lat == other.lat &&
      lng == other.lng &&
      waitingTime == other.waitingTime &&
      degree == other.degree &&
      expYear == other.expYear &&
      clinikName == other.clinikName &&
      gender == other.gender &&
      details == other.details &&
      secoundCat == other.secoundCat &&
      image == other.image &&
      apiToken == other.apiToken &&
      license == other.license &&
      deviceToken == other.deviceToken &&
      roleId == other.roleId &&
      phoneNumber == other.phoneNumber &&
      verifiedPhone == other.verifiedPhone &&
      verificationId == other.verificationId &&
      address == other.address &&
      qualification == other.qualification &&
      auth == other.auth;

  @override
  int get hashCode =>
      super.hashCode ^
      name.hashCode ^
      docId.hashCode ^
      email.hashCode ^
      price.hashCode ^
      password.hashCode ^
      lng.hashCode ^
      lat.hashCode ^
      confirm.hashCode ^
      image.hashCode ^
      clinikName.hashCode ^
      gender.hashCode ^
      roleId.hashCode ^
      cat.hashCode ^
      apiToken.hashCode ^
      genderId.hashCode ^
      rate.hashCode ^
      carType.hashCode ^
      birth.hashCode ^
      deviceToken.hashCode ^
      phoneNumber.hashCode ^
      verify.hashCode ^
      token.hashCode ^
      verifiedPhone.hashCode ^
      license.hashCode ^
      verificationId.hashCode ^
      address.hashCode ^
      waitingTime.hashCode ^
      degree.hashCode ^
      expYear.hashCode ^
      details.hashCode ^
      secoundCat.hashCode ^
      qualification.hashCode ^
      auth.hashCode;
}

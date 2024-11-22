import 'parent/model.dart';

class Booking extends Model {
  String? id;
  String? doctorId;
  String? userName;
  String? userEmail;
  String? date;
  String? msg;
  String? type;
  String? userId;
  String? email;
  String? name;
  String? password;
  String? phone;
  String? cat;
  String? image;
  String? clinikName;
  String? gender;
  String? status;
  String? lat;
  String? lng;
  String? price;
  String? waitingTime;
  String? expYears;
  String? time;
  String? rate;
  String? bookingTimeDates;
  String? phoneNumber;
  String? details;
  String? qualifications;
  String? degree;
  String? bookingTimeHours;
  String? secondCat;

  Booking(
      {this.id,
      this.doctorId,
      this.userName,
      this.userEmail,
      this.date,
      this.clinikName,
      this.time,
      this.gender,
      this.type,
      this.msg,
      this.userId,
      this.phoneNumber,
      this.email,
      this.status,
      this.name,
      this.password,
      this.phone,
      this.cat,
      this.image,
      this.lat,
      this.lng,
      this.price,
      this.waitingTime,
      this.expYears,
      this.rate,
      this.bookingTimeDates,
      this.details,
      this.qualifications,
      this.degree,
      this.bookingTimeHours,
      this.secondCat});

  Booking.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    id = json['booking_id'];
    doctorId = json['doctor_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    date = json['date'];
    msg = json['msg'];
    userId = json['user_id'];
    email = json['email'];
    phoneNumber = jsonToStr(json, 'phone');
    status = json['status'];
    type = json['type'];
    gender = jsonToStr(json, 'gender');
    clinikName = jsonToStr(json, 'building');
    name = json['name'];
    password = json['password'];
    time = json['time'];
    phone = json['phone'];
    cat = json['cat'];
    image = jsonToStr(json, 'image');
    lat = json['lat'];
    lng = json['lng'];
    price = json['price'];
    waitingTime = json['waiting_time'];
    expYears = json['exp_years'];
    rate = json['rate'];
    bookingTimeDates = json['booking_time_dates'];
    details = json['details'];
    qualifications = json['qualifications'];
    degree = json['degree'];
    bookingTimeHours = json['booking_time_hours'];
    secondCat = json['second_cat'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['booking_id'] = id;
    data['doctor_id'] = doctorId;
    data['phone'] = phoneNumber;
    data['user_email'] = userEmail;
    data['date'] = date;
    data['msg'] = msg;
    data['user_id'] = userId;
    data['email'] = email;
    data['name'] = name;
    data['user_name'] = userName;

    data['status'] = status;
    data['password'] = password;
    data['phone'] = phone;
    data['cat'] = cat;
    data['image'] = image;
    data['time'] = time;
    data['building'] = clinikName;
    data['type'] = type;
    data['gender'] = gender;
    data['lat'] = lat;
    data['lng'] = lng;
    data['price'] = price;
    data['waiting_time'] = waitingTime;
    data['exp_years'] = expYears;
    data['rate'] = rate;
    data['booking_time_dates'] = bookingTimeDates;
    data['details'] = details;
    data['qualifications'] = qualifications;
    data['degree'] = degree;
    data['booking_time_hours'] = bookingTimeHours;
    data['second_cat'] = secondCat;
    return data;
  }

  @override
  // ignore: non_nullable_equals_parameter
  bool operator ==(dynamic other) =>
      super == other &&
      other is Booking &&
      runtimeType == other.runtimeType &&
      name == other.name &&
      userName == other.userName &&
      userEmail == other.userEmail &&
      type == other.type &&
      cat == other.cat &&
      email == other.email &&
      time == other.time &&
      rate == other.rate &&
      lat == other.lat &&
      lng == other.lng &&
      waitingTime == other.waitingTime &&
      degree == other.degree &&
      expYears == other.expYears &&
      clinikName == other.clinikName &&
      gender == other.gender &&
      details == other.details &&
      image == other.image &&
      phoneNumber == other.phoneNumber &&
      qualifications == other.qualifications;

  @override
  int get hashCode =>
      super.hashCode ^
      name.hashCode ^
      email.hashCode ^
      userEmail.hashCode ^
      type.hashCode ^
      time.hashCode ^
      userName.hashCode ^
      price.hashCode ^
      password.hashCode ^
      lng.hashCode ^
      lat.hashCode ^
      image.hashCode ^
      clinikName.hashCode ^
      gender.hashCode ^
      cat.hashCode ^
      rate.hashCode ^
      phoneNumber.hashCode ^
      waitingTime.hashCode ^
      degree.hashCode ^
      expYears.hashCode ^
      details.hashCode ^
      qualifications.hashCode;
}

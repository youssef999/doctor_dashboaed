import 'package:doctor/models/parent/model.dart';

class Clinics extends Model{
  String? id;
  String? doctorId;
  String? image;
  String? txt;
  String? phone;
  String? clinckName;
  String? price;
  String? address;
  String? assistantName;
  String? assistantPhone;

  Clinics(
      {this.id,
      this.doctorId,
      this.image,
      this.txt,
      this.phone,
      this.clinckName,
      this.price,
      this.address,
      this.assistantName,
      this.assistantPhone});


  Clinics.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
      id = json['id'];
    doctorId = json['doctor_id'];
    image = json['image'];
    txt = json['txt'];
    phone = json['phone'];
    clinckName = json['clinck_name'];
    price = json['price'];
    address = json['address'];
    assistantName = json['assistant_name'];
    assistantPhone = json['assistant_phone'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['image'] = this.image;
    data['txt'] = this.txt;
    data['phone'] = this.phone;
    data['clinck_name'] = this.clinckName;
    data['price'] = this.price;
    data['address'] = this.address;
    data['assistant_name'] = this.assistantName;
    data['assistant_phone'] = this.assistantPhone;
    return data;
  }
}

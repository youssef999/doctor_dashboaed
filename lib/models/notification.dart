import 'parent/model.dart';

class Notifications extends Model {
  String? id;
  String? message;
  String? image;
  String? description;
  String? userId;

  Notifications({this.id, this.message, this.userId});

  Notifications.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    message = jsonToStr(json, 'message');
    description = jsonToStr(json, 'description');
    image = jsonToStr(json, 'image');
    userId = jsonToStr(json, 'user_id');
  }

  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["description"] = description;
    map["message"] = message;
    map["image"] = image;
    map["user_id"] = userId;
    return map;
  }

    @override
  // ignore: non_nullable_equals_parameter
  bool operator ==(dynamic other) =>
      super == other &&
      other is Notifications &&
      runtimeType == other.runtimeType &&
      userId == other.userId &&
      id == other.id &&
      message == other.message &&
      description == other.description &&
      image == other.image ;
    

  @override
  int get hashCode =>
      super.hashCode ^
      message.hashCode ^
      description.hashCode ^
      id.hashCode ^
      userId.hashCode ^

      image.hashCode ;
     
}

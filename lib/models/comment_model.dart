
import 'parent/model.dart';

class Comments extends Model {
  String? userId;
  String? name;
  String? comment;
  String? image;

  double? rate;

  Comments({this.name, this.comment, this.userId, this.rate, this.image});

  Comments.fromJson(Map<String, dynamic> json) {
    name = jsonToStr(json, 'name');

    userId = jsonToStr(json, 'id');
    rate = jsonToDouble(json, 'rate');

    comment = jsonToStr(json, 'comment');
    image = jsonToStr(json, 'image');

    super.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;

    data['id'] = userId;

    data['rate'] = rate;

    data["image"] = image;

    data['comment'] = comment;
    return data;
  }

  @override
  // ignore: non_nullable_equals_parameter
  bool operator ==(dynamic other) =>
      super == other &&
      other is Comments &&
      runtimeType == other.runtimeType &&
      name == other.name &&
      rate == other.rate &&
      comment == other.comment &&
      image == other.image;

  @override
  int get hashCode =>
      super.hashCode ^
      name.hashCode ^
      userId.hashCode ^
      image.hashCode ^
      comment.hashCode ^
      rate.hashCode;
}

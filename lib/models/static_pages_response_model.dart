class StaticPagesResponseModel {
  bool? success;
  String? message;
  StaticPagesData? data;

  StaticPagesResponseModel({this.success, this.message, this.data});

  StaticPagesResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new StaticPagesData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class StaticPagesData {
  String? sId;
  String? title;
  String? content;
  String? time;
  int? sV;

  StaticPagesData({this.sId, this.title, this.content, this.time, this.sV});

  StaticPagesData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    content = json['content'];
    time = json['time'];
    sV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['content'] = content;
    data['time'] = time;
    data['__v'] = sV;
    return data;
  }
}

class MessageResponseModel {
  bool? success;
  String? message;

  MessageResponseModel({this.success, this.message});

  MessageResponseModel.fromJson(Map json) {
    success = json['success'];
    message = json['message'];
  }

  Map toJson() {
    final Map data = {};
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}

class StaffResponseModel {
  final bool? success;
  final String? message;
  final List<Staff>? data;

  StaffResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory StaffResponseModel.fromJson(Map<String, dynamic> json) {
    return StaffResponseModel(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List<dynamic>)
          .map((e) => Staff.fromJson(e))
          .toList(),
    );
  }
}

class Staff {
  final String id;
  final String name;
  final String? email;
  final String? phone;
  final String? designation;
  final bool? isActive;

  Staff({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.designation,
    this.isActive,
  });

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      id: json['_id'],
      name: json['firstName'] ?? '',
      email: json['email'],
      phone: json['phone'],
      designation: json['designation'],
      isActive: json['isActive'],
    );
  }

  @override
  String toString() => name;
}

class ProfileModelResponse {
  final bool? success;
  final String? message;
  final ProfileData? data;

  ProfileModelResponse({
   this.success,
   this.message,
    this.data,
  });

  factory ProfileModelResponse.fromJson(Map<String, dynamic> json) {
    return ProfileModelResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? ProfileData.fromJson(json['data']) : null,
    );
  }
}

class ProfileData {
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? middleInitial;
  final String? barCode;
  final String? accessCode;
  final String? city;
  final String? image;
  final String? primaryPhone;
  final String? state;
  final String? zipCode;

  ProfileData({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.middleInitial,
    this.barCode,
    this.accessCode,
    this.city,
    this.image,
    this.primaryPhone,
    this.state,
    this.zipCode,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['_id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      middleInitial: json['middleInitial'],
      barCode: json['barCode'],
      accessCode: json['accessCode'],
      city: json['city'],
      image: json['image'],
      primaryPhone: json['primaryPhone'],
      state: json['state'],
      zipCode: json['zipCode'],
    );
  }
}

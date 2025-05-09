class CalendarLocationResponse {
  final bool? success;
  final String? message;
  final List<LocationData>? data;

  CalendarLocationResponse({
     this.success,
     this.message,
     this.data,
  });

  factory CalendarLocationResponse.fromJson(Map<String, dynamic> json) {
    return CalendarLocationResponse(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((e) => LocationData.fromJson(e))
          .toList(),
    );
  }
}

class LocationData {
  final String id;
  final String company;
  final List<Club> clubs;
  final String locationType;
  final String name;
  final bool isActive;
  final bool isDeleted;
  final String createdAt;
  final String updatedAt;

  LocationData({
    required this.id,
    required this.company,
    required this.clubs,
    required this.locationType,
    required this.name,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      id: json['_id'],
      company: json['company'],
      clubs: (json['clubs'] as List)
          .map((e) => Club.fromJson(e))
          .toList(),
      locationType: json['locationType'],
      name: json['name'],
      isActive: json['isActive'],
      isDeleted: json['isDeleted'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }


  @override
  String toString() => name ?? '';
}

class Club {
  final String id;
  final String company;
  final String email;
  final String name;
  final String phoneNumber;
  final String address;
  final String country;
  final String state;
  final String city;
  final String zipCode;
  final bool isActive;
  final bool isDeleted;
  final String createdAt;
  final String updatedAt;

  Club({
    required this.id,
    required this.company,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.country,
    required this.state,
    required this.city,
    required this.zipCode,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
      id: json['_id'],
      company: json['company'],
      email: json['email'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      zipCode: json['zipCode'],
      isActive: json['isActive'],
      isDeleted: json['isDeleted'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  @override
  String toString() => name ?? '';
}

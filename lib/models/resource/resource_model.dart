class ResourceResponse {
  final bool? success;
  final String? message;
  final List<Resource>? data;

  ResourceResponse({
     this.success,
     this.message,
    this.data,
  });

  factory ResourceResponse.fromJson(Map<String, dynamic> json) {
    return ResourceResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Resource.fromJson(e))
          .toList(),
    );
  }
}

class Resource {
  final String? id;
  final String? name;

  Resource({this.id, this.name});

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      id: json['_id'],
      name: json['name'],
    );
  }
  @override
  String toString() => name ?? '';
}

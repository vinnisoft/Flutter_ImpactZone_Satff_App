class CalendarEventSetupResponse {
  final bool? success;
  final String? message;
  final List<CalendarEvent>? data;

  CalendarEventSetupResponse({
     this.success,
     this.message, this.data,
  });

  factory CalendarEventSetupResponse.fromJson(Map<String, dynamic> json) {
    return CalendarEventSetupResponse(
      success: json['success'],
      message: json['message'],
      data: List<CalendarEvent>.from(
          json['data'].map((x) => CalendarEvent.fromJson(x))),
    );
  }
}

class CalendarEvent {
  final String id;
  final String name;
  final String? eventType;
  final bool? internalUse;
   final List<String> duration;
  CalendarEvent({
    required this.id,
    required this.name,
    this.eventType,
    this.internalUse,
    this.duration = const [],
  });

  factory CalendarEvent.fromJson(Map<String, dynamic> json) {
    return CalendarEvent(
      id: json['_id'],
      name: json['name'] ?? '',
      eventType: json['eventType'],
      internalUse: json['internalUse'],
      duration:(json['duration'] as List<dynamic>)
          .map((e) => e.toString())
          .toList()
    );
  }

  @override
  String toString() => name;
}

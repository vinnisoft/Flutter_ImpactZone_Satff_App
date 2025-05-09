import 'package:impact_zone/export.dart';

class CalendarController2 extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();

  Rx<MyAppointmentListResponseModel> myAppointmentListResponse = MyAppointmentListResponseModel().obs;
  RxList<MyAppointmentDataModel> myAppointmentList = <MyAppointmentDataModel>[].obs;
  RxBool isAppointmentLoading = false.obs;
RxList<Meeting> appointmentList = <Meeting>[].obs;
  final ScrollController scrollController = ScrollController();


  //////////////////////
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    scrollTodayDate();
    appointmentsListApi();
    super.onInit();
  }
  appointmentsListApi() {
    isAppointmentLoading.value = true;
    _repository.appointmentsApiCall().then((value) async {
      if (value != null) {
        isAppointmentLoading.value = false;
        myAppointmentListResponse.value = value;
        if(myAppointmentListResponse.value.data != null){
          appointmentList.clear();
          myAppointmentList.value = myAppointmentListResponse.value.data ?? [];
        }

        myAppointmentList.value.forEach((element) {
          // final eventDate = DateTime.parse(element.eventDate.toString());
          //
          // final startParts = element.startTime?.split(':');
          // final endParts = element.endTime?.split(':');
          //
          // final startDateTime = DateTime(
          //   eventDate.year,
          //   eventDate.month,
          //   eventDate.day,
          //   int.parse(startParts![0]),
          //   int.parse(startParts[1]),
          // );
          //
          // final endDateTime = DateTime(
          //   eventDate.year,
          //   eventDate.month,
          //   eventDate.day,
          //   int.parse(endParts![0]),
          //   int.parse(endParts[1]),
          // );


          final eventDateStr = element.eventDate.toString().split('T').first;

          final startDateTime = parseTimeWithFallback(eventDateStr, element.startTime);
          final endDateTime = parseTimeWithFallback(eventDateStr, element.endTime);
          appointmentList.add(
            Meeting(
              element.event.toString(),
              startDateTime,
              endDateTime,
              id: element.sId.toString(),
              eventType: element.eventType.toString(),
              const Color(0xFF0F8644),
              false,
              endTime: element.endTime.toString(),
              startTime: element.startTime.toString(),
              eventDate: element.eventDate.toString(),
              location: element.location.toString(),
              resource: element.resources.toString(),
              member: "",

            ),
          );
        });


      }
    }).onError((error, stackTrace) {
      isAppointmentLoading.value = false;
      showToast(message: error.toString());
    });
  }



  void scrollTodayDate() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final today = DateTime.now();
      final int index = today.day - 1;

      double itemWidth = 80.w;
     scrollController.animateTo(
        index * itemWidth,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });

  }



  DateTime parseTimeWithFallback(String date, String? timeString) {
    if (timeString == null) {
      throw FormatException('Time string is null');
    }

    // Combine the date and time into one string
    final fullDateTimeStr = '$date ${timeString.trim()}';

    // Try parsing with both formats
    try {
      // First try 24-hour format
      return DateFormat('yyyy-MM-dd HH:mm').parseStrict(fullDateTimeStr);
    } catch (_) {
      try {
        // Try 12-hour format with AM/PM
        return DateFormat('yyyy-MM-dd hh:mm a').parseStrict(fullDateTimeStr);
      } catch (e) {
        throw FormatException('Unrecognized time format: $timeString');
      }
    }
  }
}

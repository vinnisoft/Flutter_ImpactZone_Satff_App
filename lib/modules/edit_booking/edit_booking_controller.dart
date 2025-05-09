import '../../export.dart';

class EditBookingController extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();
  Rx<CalendarEventSetupResponse> eventResponseModel = CalendarEventSetupResponse().obs;
  RxList<CalendarEvent>  eventListResponse = <CalendarEvent>[].obs;
  Rx<Resource?> selectedResource = Rx<Resource?>(null);
  Rx<MemberModel?> selectedMember = Rx<MemberModel?>(null);
  Rx<CalendarEvent?> selectedEvent = Rx<CalendarEvent?>(null);
  Rx<LocationData?> selectedLocation = Rx<LocationData?>(null);
  Rx<ResourceResponse> resourceResponseModel = ResourceResponse().obs;
  RxList<Resource>  resourceListResponse = <Resource>[].obs;
  RxList<String>  resourceList = <String>[].obs;
  List<String> eventType=["Class","Appointment"];
  RxString selectedTime=''.obs;
  RxString selectedDate=''.obs;
  RxString selectedEndTime=''.obs;
  RxString selectedEventType=''.obs;
  Rx<MemberListResponseModel> memberListResponse = MemberListResponseModel().obs;
  RxList<MemberModel> myMemberList = <MemberModel>[].obs;
  RxList<String> myMemberList2 = <String>[].obs;
  RxList<String> durationList=<String>[].obs;
  RxBool isLoading = false.obs;

  Rx<CalendarLocationResponse> locationResponseModel = CalendarLocationResponse().obs;
  RxList<LocationData>  LocationListResponse = <LocationData>[].obs;
  RxList<String>  LocationList = <String>[].obs;



  var bookingId = ''.obs;
  var event = ''.obs;
  var eventType2 = ''.obs;
  var eventDate = ''.obs;
  var startTime = ''.obs;
  var endTime = ''.obs;
  var location = ''.obs;
  var resources = ''.obs;
  var member = ''.obs;

  onInit() {
    final args = Get.arguments as Map<String, dynamic>;

    bookingId.value = args["booking_id"] ?? '';
    event.value = args["event"] ?? '';
    eventType2.value = args["event_type"] ?? '';
    eventDate.value = args["event_date"] ?? '';
    startTime.value = args["start_time"] ?? '';
    selectedEndTime.value = args["end_time"] ?? '';
    location.value = args["location"] ?? '';
    resources.value = args["resources"] ?? '';
    member.value = args["member"] ?? '';




    getResourceAPi();
    getMembersAPi();
    getEventApi();
    getLocationAPi();
    super.onInit();
  }


  bookEventApi() {
    String? selectedId;
    if(selectedEvent.value==null){
      selectedId = eventListResponse
          .firstWhere((e) => event.value == e.name)
          .id;
    }
    else{
      selectedId = selectedEvent.value?.id;
    }

    isLoading.value = true;
    Map<String, dynamic> requestModel ={
      "members": [
        { "member": myMemberList[0].id.toString() }
      ],
      // "staff": "674e946bd9d9119543dec592",
      "duration": 180,
      "event": selectedId.toString(),
      "eventDate": selectedDate.value.isEmpty? eventDate.value:selectedDate.value,
      "eventType": selectedEventType.value.isEmpty?eventType2.value:selectedEventType.value,
      "location": LocationListResponse[0].id.toString()?? location.value,
      "resources": resourceListResponse[0].id.toString()?? resources.value,
      "schedule": [
        {
          "startTime": selectedTime.value?? startTime.value,
          "endTime": selectedEndTime.value?? selectedEndTime.value,
          "duration": 180
        }
      ]
    };

    _repository.updateEventApiCall(dataBody: requestModel,id: bookingId.value).then((value) async {
      if (value != null) {
        isLoading.value = false;
        Get.back(result: true);
        showToast(message:value.message.toString());
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      showToast(message: error.toString());
    });
  }



  getEventApi() {
    isLoading.value = true;
    _repository.getEventApiCall().then((value) async {
      if (value != null) {
        eventResponseModel.value = value;
        if(eventResponseModel.value.data != null){
          eventListResponse.value = eventResponseModel.value.data!;
        }
        isLoading.value = false;
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      showToast(message: error.toString());
    });
  }



  getResourceAPi() {
    isLoading.value = true;
    _repository.getResourceApiCall().then((value) async {
      if (value != null) {
        resourceResponseModel.value = value;
        if(resourceResponseModel.value.data != null){
          resourceListResponse.value = resourceResponseModel.value.data!;
          resourceList=resourceListResponse.map((e) => e.name!).toList().obs;
        }
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      showToast(message: error.toString());
    });
  }



  getMembersAPi() {
    isLoading.value = true;
    _repository.membersListApiCall().then((value) async {
      if (value != null) {
        memberListResponse.value = value;
        if(memberListResponse.value.data != null){
          myMemberList.value = memberListResponse.value.data ?? [];
          myMemberList2=myMemberList.map((e) => e.firstName!).toList().obs;
        }
      }
      update();
    }).onError((error, stackTrace) {
      isLoading.value = false;
      showToast(message: error.toString());
    });
  }




  getLocationAPi() {
    isLoading.value = true;
    _repository.getLocationApiCall().then((value) async {
      if (value != null) {
        locationResponseModel.value = value;
        if(locationResponseModel.value.data != null){
          LocationListResponse.value = locationResponseModel.value.data!;
          LocationList=LocationListResponse.map((e) => e.name).toList().obs;
        }
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      showToast(message: error.toString());
    });
  }
}
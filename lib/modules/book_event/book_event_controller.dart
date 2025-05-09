

import '../../export.dart';

class BookEventController extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();
  Rx<CalendarEventSetupResponse> eventResponseModel = CalendarEventSetupResponse().obs;
  RxList<CalendarEvent>  eventListResponse = <CalendarEvent>[].obs;
  Rx<StaffResponseModel> staffResponseModel = StaffResponseModel().obs;
  RxList<Staff>  staffListResponse = <Staff>[].obs;
  Rx<Resource?> selectedResource = Rx<Resource?>(null);
  Rx<MemberModel?> selectedMember = Rx<MemberModel?>(null);
  Rx<CalendarEvent?> selectedEvent = Rx<CalendarEvent?>(null);
  Rx<Staff?> selectedStaff = Rx<Staff?>(null);
  Rx<LocationData?> selectedLocation = Rx<LocationData?>(null);
  Rx<ResourceResponse> resourceResponseModel = ResourceResponse().obs;
  RxList<Resource>  resourceListResponse = <Resource>[].obs;
  RxList<String>  resourceList = <String>[].obs;
  List<String> eventType=["Class","Appointment"];
  RxString selectedTime=''.obs;
  RxString selectedDate=''.obs;
  RxString selectedEndTime=keyEndTime.tr.obs;
  RxList<String> durationList=<String>[].obs;
  Rx<MemberListResponseModel> memberListResponse = MemberListResponseModel().obs;
  RxList<MemberModel> myMemberList = <MemberModel>[].obs;
  RxList<String> myMemberList2 = <String>[].obs;

  RxBool isLoading = false.obs;

  Rx<CalendarLocationResponse> locationResponseModel = CalendarLocationResponse().obs;
  RxList<LocationData>  LocationListResponse = <LocationData>[].obs;
  RxList<String>  LocationList = <String>[].obs;

  onInit() {
    getResourceAPi();
    getMembersAPi();
    getEventApi();
    getLocationAPi();
    getStaffApi();
    super.onInit();
  }


  bookEventApi() {
    isLoading.value = true;
    Map<String, dynamic> requestModel ={
      "members": [
        { "member": selectedMember.value?.id.toString() }
      ],
      "staff": selectedStaff.value?.id.toString(),
      "duration": 180,
      "event": selectedEvent.value?.id.toString(),
      "eventDate": selectedDate.value,
      "eventType": "CLASS",
      "location": selectedLocation.value?.id.toString(),
      "resources": selectedResource.value?.id.toString(),
      "schedule": [
        {
          "startTime": selectedTime.value,
          "endTime": selectedEndTime.value,
          "duration": 180
        }
      ]
    };
    _repository.bookEventApiCall(dataBody: requestModel).then((value) async {
      if (value != null) {
        isLoading.value = false;
        showToast(message:value.message.toString());
        Get.back(result: true);
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



  getStaffApi() {
    isLoading.value = true;
    _repository.getStaffApiCall().then((value) async {
      if (value != null) {
        staffResponseModel.value = value;
        if(staffResponseModel.value.data != null){
          staffListResponse.value = staffResponseModel.value.data!;
        }
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      showToast(message: error.toString());
    });
  }



  getResourceAPi() {
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
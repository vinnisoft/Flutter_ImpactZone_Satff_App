import 'package:impact_zone/export.dart';


class ProfileController extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();
  RxBool isProfileLoading = false.obs;
  Rx<ProfileModelResponse> profileResponse = ProfileModelResponse().obs;
  Rx<ProfileData> profileData = ProfileData().obs;
  RxBool isEditProfile=false.obs;

  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController cityTextController = TextEditingController();
  TextEditingController stateTextController = TextEditingController();
  TextEditingController zipTextController = TextEditingController();
  TextEditingController barcodeTextController = TextEditingController();
  TextEditingController accessTextController = TextEditingController();
  TextEditingController hireDateController = TextEditingController();
  TextEditingController streetAddressTextController = TextEditingController();


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    profileApi();
    super.onInit();
  }




  profileApi() {
    isProfileLoading.value = true;
    _repository.profileDataApiCall().then((value) async {
      if (value != null) {
        isProfileLoading.value = false;
        profileResponse.value = value;
        if(profileResponse.value.data!= null){
          profileData.value = profileResponse.value.data!;
          nameTextController.text = profileData.value.firstName.toString();
          emailTextController.text = profileData.value.email.toString();
          phoneTextController.text = profileData.value.primaryPhone.toString();
          cityTextController.text = profileData.value.city.toString();
          stateTextController.text = profileData.value.state.toString();
          zipTextController.text = profileData.value.zipCode.toString();
          barcodeTextController.text = profileData.value.barCode.toString();
          accessTextController.text = profileData.value.accessCode.toString();
          // hireDateController.text = profileData.value.hireDate!;
          // streetAddressTextController.text = profileData.value.st!;


        }
      }
    }).onError((error, stackTrace) {
      isProfileLoading.value = false;
      showToast(message: error.toString());
    });
  }






  updateProfileApiCall() {
    Map<String, dynamic> requestModel = {
      "email": emailTextController.text.trim(),
      "firstName": nameTextController.text.trim(),
      "middleInitial": "",
      "barCode": barcodeTextController.text.trim(),
      "accessCode": accessTextController.text.trim(),
      "city": cityTextController.text.trim(),
      "primaryPhone": phoneTextController.text.trim(),
      "state": stateTextController.text.trim(),
      "zipCode": zipTextController.text.trim(),
      "streetAddress": streetAddressTextController.text.trim(),
      "hireDate": hireDateController.text.trim(),
    };

    isProfileLoading.value = true;
    _repository.updateProfileApiCall(dataBody: requestModel).then((value) async {
      if( value != null) {
        isProfileLoading.value = false;
        showToast(message: value.message.toString());
        isEditProfile.value=false;
      }
      profileApi();
    }).onError((error, stackTrace) {
      isProfileLoading.value = false;
      showToast(message: error.toString());
    });
  }

}

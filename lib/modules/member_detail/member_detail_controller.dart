import 'package:impact_zone/export.dart';

class MemberDetailController extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();

  RxBool isMemberDetailLoading = false.obs;
  RxString memberId = ''.obs;

  Rx<MemberDetailResponseModel> memberDetailResponse = MemberDetailResponseModel().obs;
  Rx<MemberDetailDataModel> memberData = MemberDetailDataModel().obs;

  @override
  void onInit() {
    if(Get.arguments!= null){
      memberId.value = Get.arguments['member_id'];
    }
    super.onInit();
  }

  @override
  void onReady() {
    memberDetailApi();
    super.onReady();
  }

  memberDetailApi() {
    isMemberDetailLoading.value = true;
    _repository.memberDetailApiCall(id: memberId.value).then((value) async {
      if (value != null) {
        isMemberDetailLoading.value = false;
        memberDetailResponse.value = value;
        if(memberDetailResponse.value.data!= null){
          memberData.value = memberDetailResponse.value.data!;
        }
      }
    });
  }




}
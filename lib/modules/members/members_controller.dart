import 'package:impact_zone/export.dart';


class MembersController extends GetxController{
  final APIRepository _repository = Get.find<APIRepository>();
  RxBool isMembersListApiCall = false.obs;
  Rx<MemberListResponseModel> memberListResponse = MemberListResponseModel().obs;
  List<MemberModel> myMemberList = <MemberModel>[];
  int len=0;
  RxList<MemberModel> filteredItems = <MemberModel>[].obs;
  TextEditingController searchTextController=TextEditingController();
  final Duration _debounceDuration = Duration(milliseconds: 500);
  Timer? _debounce;
  RxInt selectedTab = 0.obs;
  @override
  void onReady() {
    todoListApi();
    super.onReady();
  }


  @override
  void onInit() {
    super.onInit();
    searchTextController.addListener(_onSearchChanged);
  }



  todoListApi() {
    isMembersListApiCall.value = true;
    _repository.membersListApiCall().then((value) async {
      if (value != null) {
        isMembersListApiCall.value = false;
        memberListResponse.value = value;
        if(memberListResponse.value.data != null){
          myMemberList = memberListResponse.value.data ?? [];
        }
        filteredItems.value=myMemberList;
      }
      update();
    }).onError((error, stackTrace) {
      isMembersListApiCall.value = false;
      showToast(message: error.toString());
    });
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(_debounceDuration, () {
      final query = searchTextController.text.toLowerCase();
      filteredItems.value = myMemberList
          .where((item){
        final first = item.firstName?.toLowerCase() ?? '';
        final last = item.lastName?.toLowerCase() ?? '';
        return first.contains(query) || last.contains(query);

      })
          .toList();
      update();
    });
  }

  @override
  void dispose() {
    searchTextController.removeListener(_onSearchChanged);
    searchTextController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

}
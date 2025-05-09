
import 'package:impact_zone/export.dart';

class PosController extends GetxController{
  final APIRepository _repository = Get.find<APIRepository>();
  RxBool isInventoryCategoryLoading = false.obs;
  Rx<InventoryResponse> inventoryCategoryListResponse = InventoryResponse().obs;
  RxList<InventoryItem> inventoryCategoryList = <InventoryItem>[].obs;
  RxList<InventoryItem> serviceList = <InventoryItem>[].obs;
  /////////// functionalities ////////////
  RxList<int> serviceQuantities = <int>[].obs;
  RxInt productQuantities = 0.obs;
  RxList<int> selectedServices = <int>[].obs;
  RxList<int> selectedProducts = <int>[].obs;

  ////////////////////////////////////////////
  List<Map<String, String>> iconItems = [
    {
      'icon': AppImages.iconsService,
      'title': keyServices.tr,
    },
    // {
    //   'icon': AppImages.iconsAgreements,
    //   'title': keyAgreements.tr,
    // },
    {
      'icon': AppImages.iconsProduct,
      'title':  keyProducts.tr,
    },
  ];
  RxInt selectedTab = 0.obs;
  RxInt categoryIndex=0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    inventoryCategoryListApi();
    super.onReady();
  }

  tapOnCategory(int index){
    categoryIndex.value=index;
  }





  inventoryCategoryListApi() {
    isInventoryCategoryLoading.value = true;
    _repository.inventoryCategoryApiCall().then((value) async {
      if (value != null) {
        isInventoryCategoryLoading.value = false;
        inventoryCategoryListResponse.value = value;
        if(inventoryCategoryListResponse.value.data != null){
          inventoryCategoryList.value = inventoryCategoryListResponse.value.data ?? [];
          serviceList.value=inventoryCategoryList.where((element) => element.type?.toLowerCase() == 'service'.toLowerCase()).toList();
          inventoryCategoryList.value=inventoryCategoryList.where((element) => element.type?.toLowerCase() == 'product'.toLowerCase()).toList();
        }
      }
      update();
    }).onError((error, stackTrace) {
      isInventoryCategoryLoading.value = false;
      showToast(message: error.toString());
    });
  }

  decreaseServiceQuantity(int index){
    if(serviceList[index].defaultQuantity.value==1){
      return;
    }
    serviceList[index].defaultQuantity=serviceList[index].defaultQuantity-1;
  }
  increaseServiceQuantity(int index){
    serviceList[index].defaultQuantity=serviceList[index].defaultQuantity+1;
    print("quantity ${serviceList[index].defaultQuantity}");
  }


  decreaseProductQuantity(int index){
    if(inventoryCategoryList[index].defaultQuantity.value==1){
      return;
    }
    inventoryCategoryList[index].defaultQuantity=inventoryCategoryList[index].defaultQuantity-1;
  }

  increaseProductQuantity(int index){
    inventoryCategoryList[index].defaultQuantity=inventoryCategoryList[index].defaultQuantity+1;
    print("quantity ${inventoryCategoryList[index].defaultQuantity}");
  }

}
import 'package:impact_zone/export.dart';

class PosCheckOutDetailsController extends GetxController{
  RxString  title ="".obs;
  @override
  void onInit() {
    super.onInit();
  }
@override
  void onReady() {
  final args = Get.arguments;
  if(args!=null){
    title.value = args['title'];
  }
    super.onReady();
  }
}
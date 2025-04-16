import 'package:impact_zone/export.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
          () => CartController(),
    );
  }
}
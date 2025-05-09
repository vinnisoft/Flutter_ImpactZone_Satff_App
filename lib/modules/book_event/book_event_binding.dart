import 'package:impact_zone/export.dart';

class BookEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookEventController>(
          () => BookEventController(),
    );
  }
}
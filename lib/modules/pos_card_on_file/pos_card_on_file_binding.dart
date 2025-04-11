import 'package:impact_zone/export.dart';
import 'package:impact_zone/modules/pos/pos_controller.dart';
import 'package:impact_zone/modules/pos_card_on_file/pos_card_on_file_controller.dart';

class PosCardOnFileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PosCardOnFileController>(
          () => PosCardOnFileController(),
    );
  }
}
import 'package:impact_zone/export.dart';

class LoggerX {
  static void write(String text, {bool isError = false}) {
    Future.microtask(() => isError ? log.t(text) : log.i(text));
  }
}

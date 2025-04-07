
import 'package:impact_zone/export.dart';

class AnnotatedRegionWidget extends StatelessWidget {
  final Widget child;
  final Color statusBarColor;
  final Brightness statusBarBrightness;

  const AnnotatedRegionWidget(
      {super.key,
      required this.child,
      this.statusBarColor = Colors.black,
      required this.statusBarBrightness});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: statusBarColor,
            statusBarBrightness: statusBarBrightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark, // ios
            statusBarIconBrightness: statusBarBrightness),
        child: ColorfulSafeArea(
          color: statusBarColor,
          bottom: Platform.isAndroid ? true : false,
          child: child,
        ));
  }
}

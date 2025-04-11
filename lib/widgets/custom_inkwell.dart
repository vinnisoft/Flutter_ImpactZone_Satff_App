
import 'package:impact_zone/export.dart';

class GetInkWell extends StatelessWidget {
  final Widget child;
  final Function? onTap;

  const GetInkWell({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: child,
    );
  }
}

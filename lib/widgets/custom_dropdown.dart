import 'package:impact_zone/export.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<T?> dropdownItems;
  final List<DropdownMenuItem<T>>? dropdownItemsValues;
  final T? dropdownValue;
  final EdgeInsets? contentPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hint;
  final String? label;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final InputBorder? decoration;
  final String? Function(dynamic)? validate;
  final Function(dynamic)? onChanged;
  final FocusNode? focusNode;
  final bool isRequired;
  final double? radius;

  const CustomDropdown({
    super.key,
    required this.dropdownItems,
    this.dropdownItemsValues,
    this.dropdownValue,
    this.contentPadding,
    this.prefixIcon,
    this.suffixIcon,
    this.hint,
    this.label,
    this.hintStyle,
    this.fillColor,
    this.decoration,
    this.focusNode,
    this.validate,
    required this.onChanged,
    this.isRequired = false,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      decoration: inputDecoration(context),
      onChanged: onChanged,
      focusNode: focusNode,
      isExpanded: true,
      value: dropdownValue,
      isDense: true,
      dropdownStyleData: DropdownStyleData(
        maxHeight: 200.h,
        decoration: const BoxDecoration(
          color: AppColors.secondaryAppColor,
        ),
      ),
      hint: Text(
        hint ?? '',
        style: hintStyle ??
            textStyleBodyMedium()
                .copyWith(color: AppColors.secondaryTextColor,),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: Theme.of(context).textTheme.bodyMedium,
      validator: validate,
      items: dropdownItemsValues ??
          dropdownItems.map<DropdownMenuItem<T>>((value) {
            return DropdownMenuItem<T>(
              value: value,
              child: Text(
                value.toString(),
                style: textStyleBodyMedium(),
                maxLines: 2,
              ),
            );
          }).toList(),
    );
  }

  inputDecoration(context) => InputDecoration(
    errorMaxLines: 2,
    filled: true,
    isCollapsed: true,
    isDense: true,
    counterText: '',
    contentPadding: contentPadding ??
        EdgeInsets.only(
            top: 10.w,
            bottom: 10.w,
            right: 8.w,
            left: 0.w),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: hintStyle ??
            textStyleBodyMedium()
                .copyWith(color: AppColors.secondaryTextColor,),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        fillColor: fillColor ?? Colors.transparent,
        border: decoration ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryTextColor,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(radius ?? 20.r)),
        enabledBorder: decoration ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryTextColor,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(radius ?? 20.r)),
        disabledBorder: decoration ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryTextColor,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(radius ?? 20.r)),
        focusedBorder: decoration ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryTextColor,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(radius ?? 20.r)),
        focusedErrorBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(radius ?? 20.r)),
        errorBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(radius ?? 20.r)
        ),
      );
}

import 'package:impact_zone/export.dart';

class CustomDropdown2<T> extends StatelessWidget {
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

  const CustomDropdown2({
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
    return DropdownButtonFormField2<T>(
      decoration: inputDecoration(context),
      onChanged: onChanged,
      focusNode: focusNode,
      isExpanded: true,
      value: dropdownValue,
      isDense: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: Theme.of(context).textTheme.bodyMedium,
      validator: validate,

      hint: Row(
        children: [
          prefixIcon ??
              AssetImageWidget(
                'assets/icons/member.png',
                imageWidth: 20.h,
                imageHeight: 20.w,
              ),
          const SizedBox(width: 10),
          Text(
            hint ?? keySelect.tr,
            style: hintStyle ??
                textStyleBodyMedium().copyWith(
                  color: AppColors.secondaryTextColor,
                ),
          ),
        ],
      ),

      // Custom render for selected item (no divider here)
      selectedItemBuilder: (BuildContext context) {
        return dropdownItems.map((value) {
          return Row(
            children: [
              Text(
                value.toString(),
                style: textStyleBodyMedium().copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
                maxLines: 2,
              ),
            ],
          );
        }).toList();
      },

      // Dropdown list items with dividers
      items: dropdownItemsValues ??
          dropdownItems.asMap().entries.map<DropdownMenuItem<T>>((entry) {
            final index = entry.key;
            final value = entry.value;
            final isLastItem = index == dropdownItems.length - 1;

            return DropdownMenuItem<T>(
              value: value,
              child: Column(
                mainAxisSize: MainAxisSize.min, // <-- Add this line
                children: [
                  Row(
                    children: [
                      Text(
                        value.toString(),
                        style: textStyleBodyMedium().copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                  if (!isLastItem)
                    Divider(color: AppColors.containerGreyColor).paddingOnly(top: 10.h),
                ],
              ),
            );
          }).toList(),
    );
  }

  InputDecoration inputDecoration(BuildContext context) => InputDecoration(
    errorMaxLines: 2,
    filled: true,
    isCollapsed: true,
    isDense: true,
    counterText: '',
    contentPadding: contentPadding ??
        EdgeInsets.only(top: 10.w, bottom: 10.w, right: 8.w, left: 0.w),
    suffixIcon: suffixIcon,
    hintText: hint,
    hintStyle: hintStyle ??
        textStyleBodyMedium().copyWith(
          color: AppColors.secondaryTextColor,
        ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    fillColor: fillColor ?? Colors.transparent,
    border: decoration ??
        OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryTextColor,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
    enabledBorder: decoration ??
        OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.containerGreyColor,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
    disabledBorder: decoration ??
        OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.containerGreyColor,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
    focusedBorder: decoration ??
        OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.containerGreyColor,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 1.w,
      ),
      borderRadius: BorderRadius.circular(radius ?? 10.r),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 1.w,
      ),
      borderRadius: BorderRadius.circular(radius ?? 10.r),
    ),
  );
}

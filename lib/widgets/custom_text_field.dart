import 'package:impact_zone/export.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hint;
  final double? radius;
  final Color? color;
  final Color? courserColor;
  final Color? fillColor;
  final String? label;
  final String? Function(String?)? validate;
  final TextStyle? hintStyle;
  final EdgeInsets? contentPadding;
  final TextInputType? inputType;
  final TextEditingController? textController;
  final FocusNode? focusNode;
  final Function(String value)? onFieldSubmitted;
  final Function()? onTap;
  final TextInputAction? inputAction;
  final bool? hideBorder;
  final bool? isFilled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLine;
  final InputBorder? decoration;
  final int? minLine;
  final int? maxLength;
  final bool readOnly;
  final bool? shadow;
  final bool? obscureText;
  final bool? isOutlined;
  final Function(String value)? onChange;
  final List<TextInputFormatter>? inputFormatter;
  final Color? errorColor;
  final Widget? prefix;
  final Color? borderColor;

  const TextFieldWidget({
    super.key,
    this.hint,
    this.inputType,
    this.textController,
    this.hintStyle,
    this.prefix,
    this.courserColor,
    this.validate,
    this.onChange,
    this.decoration,
    this.radius,
    this.focusNode,
    this.readOnly = false,
    this.shadow,
    this.onFieldSubmitted,
    this.inputAction,
    this.contentPadding,
    this.isOutlined = false,
    this.maxLine = 1,
    this.minLine = 1,
    this.maxLength,
    this.color,
    this.hideBorder = true,
    this.suffixIcon,
    this.prefixIcon,
    this.label,
    this.obscureText,
    this.onTap,
    this.isFilled,
    this.fillColor,
    this.inputFormatter,
    this.errorColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null && label != ''
            ? Text(
         label ?? '',
              style: textStyleTitleMedium().copyWith(color: AppColors.primaryTextColor),
        ).paddingOnly(bottom: 6.w)
            : const SizedBox(),
        TextFormField(
            readOnly: readOnly,
            onTap: onTap,
            obscureText: obscureText ?? false,
            controller: textController,
            focusNode: focusNode,
            keyboardType: inputType,
            maxLength: maxLength,
            onChanged: onChange,
            cursorColor: courserColor ?? AppColors.primaryTextColor,
            inputFormatters: inputFormatter ??
                [
                  FilteringTextInputFormatter(
                      RegExp(
                          '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
                      allow: false),
                  // FilteringTextInputFormatter.deny(
                  //     RegExp(r'\s')),
                ],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLines: maxLine,
            minLines: minLine,
            textInputAction: inputAction,
            onFieldSubmitted: onFieldSubmitted,
            validator: validate,
            style:  textStyleBodyMedium()
                .copyWith(color: AppColors.primaryTextColor, fontWeight: FontWeight.w500),
            decoration: inputDecoration()),
      ],
    );
  }

  inputDecoration() => InputDecoration(
      counterText: "",
      errorMaxLines: 3,
      isDense: false,
      errorStyle: textStyleBodySmall().copyWith(
          fontSize: 12.sp,
          height: 0,
          color: errorColor ?? Colors.red),
      filled: isFilled ?? true,
      contentPadding: contentPadding ??
          EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 12.h,
          ),
      prefixIcon: prefixIcon,
      prefix: prefix,
      suffixIcon: isOutlined == true ? null : suffixIcon,
      hintText: hint,
      hintStyle: hintStyle ??
          textStyleBodyMedium()
              .copyWith(color: AppColors.secondaryTextColor,),
      fillColor: fillColor ?? Colors.transparent,
      border: decoration ??
          OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.textFieldBorderColor,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(radius ?? 8.r)),
      focusedErrorBorder: decoration ??
          OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(radius ?? 8.r)),
      errorBorder: decoration ??
          OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(radius ?? 8.r)),
      focusedBorder: decoration ??
          OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.textFieldBorderColor,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(radius ?? 8.r)),
      enabledBorder: decoration ??
          OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.textFieldBorderColor,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(radius ?? 8.r)));
}

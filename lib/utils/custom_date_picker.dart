
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:impact_zone/export.dart';

class CustomDatePicker extends StatefulWidget {
  Function(String date)  onDateSelected;
   CustomDatePicker({required this.onDateSelected,Key? key}) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? _selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    final firstDate = DateTime.now().subtract(const Duration(days: 365));
    final lastDate = DateTime.now().add(const Duration(days: 365));

  dp.DatePickerRangeStyles  styles = dp.DatePickerRangeStyles(
      selectedSingleDateDecoration: BoxDecoration(
        color: Colors.indigo.shade900, // Customize your circle color
        shape: BoxShape.circle,
      ),
      selectedDateStyle:textStyleBodyMedium().copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
      ),
      defaultDateTextStyle: textStyleBodyMedium().copyWith(
        color: AppColors.appColor,
        fontSize: 14.sp,
      ),
      disabledDateStyle: textStyleBodyMedium().copyWith(
        color: AppColors.secondaryTextColor,
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4.h,
            width: 80.w,
            color: Colors.grey[300],
            margin: EdgeInsets.only(bottom: 10.h),
          ),
          Text(
            keySelectDate.tr,
            style:textStyleHeadlineMedium().copyWith(fontSize: 20.sp,fontWeight: FontWeight.w700,color: AppColors.appColor),
          ),
          SizedBox(height: 10.h),
          dp.DayPicker.single(
            selectedDate: _selectedDate ?? DateTime.now(),
            onChanged: (newDate) {
              setState(() {
                _selectedDate = newDate;
              });
            },
            firstDate: firstDate,
            lastDate: lastDate,
            datePickerStyles: styles,
            datePickerLayoutSettings: const dp.DatePickerLayoutSettings(
              showPrevMonthEnd: true,
              showNextMonthStart: true,
            ),
            selectableDayPredicate: (day) => true,
          ),

          SizedBox(height: 20.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _actionButton(keyCancel.tr, Colors.grey.shade300, Colors.white, () {
                  Navigator.pop(context);
                }),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: _actionButton(keySave.tr, Colors.indigo.shade900, Colors.white, () {
                  // Handle save logic
                  widget.onDateSelected(_selectedDate.toString());
                  Navigator.pop(context);
                }),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _actionButton(String text, Color bg, Color fg, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bg,
        foregroundColor: fg,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

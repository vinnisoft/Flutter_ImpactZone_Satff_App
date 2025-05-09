import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:impact_zone/app_values/text_styles.dart';
import '../app_values/app_colors.dart';

class PrimaryBottomButton extends StatelessWidget {
  final Function() callBack;
  final String title;
  final bool disable;
  const PrimaryBottomButton({
    required this.callBack,
   required this.title,
   this.disable=false,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: ()=>!disable?callBack():(){},
        child: Container(
          height: 46.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color:disable?AppColors.containerGreyColor:AppColors.appColor,
              borderRadius: BorderRadius.circular(5.r)
          ),
          child: Center(child: Text(title.tr,style:textStyleHeadlineMedium().copyWith(color: Colors.white,fontSize:16,fontWeight: FontWeight.w700),)),
        ),
    );
  }
}

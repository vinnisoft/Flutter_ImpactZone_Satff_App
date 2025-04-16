import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:impact_zone/app_values/app_images.dart';
import 'package:impact_zone/export.dart';
import 'package:impact_zone/modules/pos_card_on_file/pos_card_on_file_controller.dart';
import 'package:impact_zone/widgets/top_banner.dart';

import '../../app_values/app_colors.dart';
import '../../translation/local_keys.dart';

class PosCardOnFileScreen extends GetView<PosCardOnFileController> {
  const PosCardOnFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitleText:"Card on File" ,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // topBanner(title: "Card on File"),
            _amountDetails(),
            Text("Credit & Debit Cards",style: TextStyle(color:AppColors.primaryTextColor,fontSize: 20,fontWeight: FontWeight.w700),).paddingSymmetric(horizontal: 25),
            _cardOptions(),
            _addNewCard()
          ],
        ),
      ),
    );
  }

  _amountDetails() {
    return Container(
      margin: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
          ]),
      child: Container(
        padding: EdgeInsets.all(20.h),
        decoration: BoxDecoration(
            color: AppColors.blueBgColor,
            borderRadius: BorderRadius.circular(6.r)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(keyDetails.tr,style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w700,fontSize: 20),),
            _itemDetails(keyDiscounts.tr),
            _itemDetails(keyTax.tr),
            _itemDetails(keyTotal.tr),
          ],
        ),
      ).paddingAll(20.h),
    );
  }

  _itemDetails(String title){
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500,fontSize: 14)),
        Text("\$2.00",style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w700,fontSize: 14)),
      ],
    ).paddingSymmetric(vertical: 10.h);
  }

  _cardOptions() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
          ]),
         child: Obx(
             () {
               controller.selectedIndex.value;
               return ListView.builder(
             shrinkWrap: true,
             itemCount: 3,
               itemBuilder: (_,index)=>_cardItem(index)
           );
             },
         )
      /*Column(
           children: [
             _cardItem(),
             Divider(color: AppColors.containerGreyColor,).paddingSymmetric(vertical: 10.h),
             _cardItem(),
             Divider(color: AppColors.containerGreyColor,).paddingSymmetric(vertical: 10.h),
             _cardItem(),

           ],
         ),*/
    );
  }

  _cardItem(int index) {
    return  Column(
      children: [
        Row(
          children: [
          Image.asset(AppImages.iconsVisaIcon).paddingOnly(right: 10),
          Expanded(child: Text("**** **** **** 4567",style: TextStyle(color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500,fontSize: 16),)),
          InkWell(
             onTap: ()=>controller.selectPaymentMethod(index),
              child:  controller.selectedIndex.value==index?Image.asset(AppImages.iconsCompleteTodo):Image.asset(AppImages.iconsUnCheckTodo)),
        ],
        ),
        controller.selectedIndex.value==index?Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.appColor)
              ),
              child:Text("CVV",style: TextStyle(color: AppColors.secondaryTextColor,fontSize: 14,fontWeight: FontWeight.w400),)
            ).paddingSymmetric(horizontal: 10),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.containerGreyColor),
                   color:AppColors.appColor
                ),
                child:Text("Pay \$200",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700),)
            ),
          ],
        ):SizedBox(),
        index==2?SizedBox():Divider(color: AppColors.containerGreyColor,).paddingSymmetric(vertical: 10.h),
      ],
    );
  }

  _addNewCard() {
    return InkWell(
      onTap: ()=>Get.toNamed(AppRoutes.routePosAddNewScreen),
      child: Container(
        margin: EdgeInsets.all(20.h),
        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
            ]),
        child:Row(
          children: [
            Image.asset(AppImages.iconsAddNewCardIcon).paddingOnly(right: 10),
            Text(keyAddNewCard.tr,style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w500,fontSize: 16),)
          ],
        ) ,
      ),
    );
  }
}

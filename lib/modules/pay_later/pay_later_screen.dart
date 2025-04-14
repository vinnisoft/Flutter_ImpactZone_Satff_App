import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:impact_zone/export.dart';
import 'package:impact_zone/modules/pay_later/pay_later_controller.dart';
import 'package:impact_zone/widgets/primary_bottom_button.dart';

class PayLaterScreen extends GetView<PayLaterController> {
  const PayLaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitleText: keyPayLater.tr,
        actionWidget: [
        AssetImageWidget(
          AppImages.iconsNotification,
          imageHeight: 20.h,
        ),
      ],),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _amountDetails(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.all(20.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(keyDate.tr,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: AppColors.primaryTextColor),),
                  _selectDate(),
                  SizedBox(height: 20.h,),
                  Text(keySavedCards.tr,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: AppColors.primaryTextColor),),
                  _cardOptions(),
                  PrimaryBottomButton(callBack: (){}, title: keySave.tr).paddingOnly(top: 20)
                ],
              ),
            ).paddingOnly(bottom: 20),
        
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            // margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
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
                    physics: NeverScrollableScrollPhysics(),
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
        ),
      ],
    );
  }


  _cardItem(int index) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(AppImages.iconsVisaIcon).paddingOnly(right: 10),
            Expanded(child: Text("**** **** **** 4567",style: TextStyle(color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500,fontSize: 16),)),
            InkWell(
                onTap: ()=>controller.selectPaymentMethod(index),
                child: /* controller.selectedIndex.value==index?Image.asset(AppImages.iconsCompleteTodo):*/Image.asset(AppImages.iconsUnCheckTodo)),
          ],
        ),
        // controller.selectedIndex.value==index?Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Container(
        //         padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             border: Border.all(color: AppColors.appColor)
        //         ),
        //         child:Text("CVV",style: TextStyle(color: AppColors.secondaryTextColor,fontSize: 14,fontWeight: FontWeight.w400),)
        //     ).paddingSymmetric(horizontal: 10),
        //     Container(
        //         padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             border: Border.all(color: AppColors.containerGreyColor),
        //             color:AppColors.appColor
        //         ),
        //         child:Text("Pay \$200",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700),)
        //     ),
        //   ],
        // ):SizedBox(),
        index==2?SizedBox():Divider(color: AppColors.containerGreyColor,).paddingSymmetric(vertical: 10.h),
      ],
    );
  }

  _selectDate() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.containerGreyColor),
          borderRadius: BorderRadius.circular(12.r)
      ),
      child: Row(
        children: [
          Image.asset(AppImages.iconsDate,width: 25,),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Select',
                  contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                  filled: true,
                  isDense: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintStyle: TextStyle(color: AppColors.secondaryTextColor)
              ),
              onTap: () {
                // open your modal, popup, or dropdown logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:impact_zone/export.dart';
import 'package:impact_zone/modules/pos_card_on_file/pos_card_on_file_controller.dart';
import 'package:impact_zone/widgets/primary_bottom_button.dart';

class AddNewCardScreen extends GetView<PosCardOnFileController> {
  const AddNewCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitleText: keyAddNewCard.tr, actionWidget: [
        AssetImageWidget(
          AppImages.iconsNotification,
          imageHeight: 20.h,
        ),
      ],),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(keyNameOnCard.tr,style: TextStyle(color: AppColors.primaryTextColor,fontSize: 16,fontWeight: FontWeight.w500),),
                _cardForm(hintText: "Aycan Doganlar",icon: AppImages.iconsSingleUserIcon),
                Text(keyCardNumber.tr,style: TextStyle(color: AppColors.primaryTextColor,fontSize: 16,fontWeight: FontWeight.w500),),
                _cardForm(icon:AppImages.iconsCardIcon ,hintText:"1234 4567 7890 1234" ),

                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment:  CrossAxisAlignment.start,
                        children: [
                          Text(keyExpiry.tr,style: TextStyle(color: AppColors.primaryTextColor,fontSize: 16,fontWeight: FontWeight.w500),),
                          _cardForm(icon:AppImages.iconsDate ,hintText:"02/24" ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:  CrossAxisAlignment.start,
                        children: [
                          Text(keyCVV.tr,style: TextStyle(color: AppColors.primaryTextColor,fontSize: 16,fontWeight: FontWeight.w500),),
                          _cardForm(hintText:"•••" ,icon:AppImages.iconsCvvIcon ),
                        ],
                      ),
                    ),
                  ],
                ),
                PrimaryBottomButton(callBack: (){
                  print("ok");
                }, title: keyAdd.tr,).paddingOnly(top: 20)
              ],
            ),
          ).paddingAll(20),

        ],
      ),
    );
  }

  _cardForm({required String icon,required String hintText}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.containerGreyColor),
          borderRadius: BorderRadius.circular(12.r)
      ),
      child: Row(
        children: [
          Image.asset(icon,width: 25,),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: hintText,
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
    ).paddingOnly(bottom: 20);
  }
}

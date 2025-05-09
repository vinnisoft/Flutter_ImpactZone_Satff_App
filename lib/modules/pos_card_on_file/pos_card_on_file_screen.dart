import 'package:impact_zone/export.dart';


class PosCardOnFileScreen extends GetView<PosCardOnFileController> {
  const PosCardOnFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitleText:keyCardOnFile.tr,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _amountDetails(),
            Text(keyCreditDebitCards.tr,style:textStyleHeadlineLarge(),).paddingSymmetric(horizontal: 25),
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
            BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 10.r)
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
            Text(keyDetails.tr,style:textStyleHeadlineLarge()),
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
        Text(title,style:textStyleBodySmall().copyWith(fontSize: 14.sp)),
        Text("\$2.00",style:textStyleHeadlineSmall()),
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
            BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 10.r)
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
    );
  }

  _cardItem(int index) {
    return  Column(
      children: [
        Row(
          children: [
            AssetImageWidget(AppImages.iconsVisaIcon).paddingOnly(right: 10.w),
          Expanded(child: Text("**** **** **** 4567",style:textStyleBodyMedium().copyWith(fontSize: 16.sp))),
          InkWell(
             onTap: ()=>controller.selectPaymentMethod(index),
              child:  controller.selectedIndex.value==index?AssetImageWidget(AppImages.iconsCompleteTodo):AssetImageWidget(AppImages.iconsUnCheckTodo)),
        ],
        ),
        controller.selectedIndex.value==index?Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.appColor)
              ),
              child:Text("CVV",style:textStyleBodyMedium())
            ).paddingSymmetric(horizontal: 10.w),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.containerGreyColor),
                   color:AppColors.appColor
                ),
                child:Text("Pay \$200",style: textStyleHeadlineMedium().copyWith(fontSize:16.sp,color: Colors.white),)
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
              BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 10.r)
            ]),
        child:Row(
          children: [
            AssetImageWidget(AppImages.iconsAddNewCardIcon).paddingOnly(right: 10.w),
            Text(keyAddNewCard.tr,style: textStyleHeadlineMedium())
          ],
        ) ,
      ),
    );
  }
}

import 'package:impact_zone/export.dart';


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
            AssetImageWidget(AppImages.iconsVisaIcon).paddingOnly(right: 10),
            Expanded(child: Text("**** **** **** 4567",style: TextStyle(color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500,fontSize: 16),)),
            InkWell(
                onTap: ()=>controller.selectPaymentMethod(index),
                child:AssetImageWidget(AppImages.iconsUnCheckTodo)),
          ],
        ),
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
          AssetImageWidget(AppImages.iconsDate,imageWidth: 25.w,),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: keySelect.tr,
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

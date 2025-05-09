import 'package:impact_zone/export.dart';


class CartScreen extends GetView<CartController> {
   CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitleText: keyCart.tr, actionWidget: [
        AssetImageWidget(
          AppImages.iconsNotification,
          imageHeight: 20.h,
        ),
      ],),
      body: SingleChildScrollView(
        child: Column(
            children: [
           _cart(),
            ],
          )

      ),
    );
  }
  _cart() {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 10.r)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(keyItem.tr,style:textStyleDisplayLarge().copyWith(fontSize: 20.sp,fontWeight: FontWeight.w700,color: AppColors.primaryTextColor),),
         Obx(
             () {
               controller.cartList.length;
               return ListView.builder(
             physics: NeverScrollableScrollPhysics(),
               shrinkWrap: true,
               padding: EdgeInsets.zero,
               itemCount: controller.cartList.length,
               itemBuilder:_items
           );
             },
         ),
          Divider(color: AppColors.containerGreyColor,).paddingSymmetric(vertical: 10.h),
          Text(keyMember.tr,style:textStyleDisplayLarge().copyWith(color: AppColors.primaryTextColor,fontWeight: FontWeight.w500,fontSize: 16.sp),),


          Obx(
                () {
              controller.myMemberList2.length;
              return CustomDropdown2<MemberModel>(dropdownItems:controller.myMemberList,
                onChanged: (value) {
                  controller.myMemberList.value = value;
                },
                radius: 6.r
              );

            },

          ),
          Divider(color: AppColors.containerGreyColor,).paddingSymmetric(vertical: 10.h),
          Text(keyDiscount.tr,style:textStyleDisplayMedium().copyWith(color: AppColors.primaryTextColor,fontWeight: FontWeight.w500,fontSize: 16.sp),),
          _discountTextField(),
          Divider(color: AppColors.containerGreyColor,).paddingSymmetric(vertical: 10.h),
          _detailsContainer(),
          SizedBox(height: 20.h,),
          _bottomButton(onClickCallBack: (){
            Get.toNamed(AppRoutes.routeCheckOutScreen);
          }),
          SizedBox(height: 10.h,),
          _bottomButton(onClickCallBack: (){
            Get.toNamed(AppRoutes.routeCartScreen);
          },isCheckOut: false),
        ],
      ),
    ).paddingAll(20.h);
  }

  Widget _circleButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(24.r),
      child: Container(
        width: 20.w,
        height: 20.h,
        decoration: const BoxDecoration(
          color: AppColors.containerBorderColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 18.sp),
      ),
    );
  }

  Widget? _items(BuildContext context, int index) {
     if(!controller.selectedCartList.contains(index)){
       return SizedBox();
     }
     WidgetsBinding.instance.addPostFrameCallback((_) {
       controller.getPrice(index);
     });

    return  Container(
      padding: EdgeInsets.all(12.h),
      margin: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.containerBorderGreyColor),
          borderRadius: BorderRadius.circular(6.r)
      ),
      child: Obx(
        ()=> Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Spacer(),
                Text("\$${double.tryParse(controller.cartList[index].finalTotal.value.toString()??"0.0")?.toStringAsFixed(2)}",maxLines:1,overflow:TextOverflow.ellipsis,style:textStyleDisplayMedium().copyWith(color: AppColors.primaryTextColor,fontWeight: FontWeight.w700,fontSize: 16.sp),),
              ],
            ),

            Row(
              children: [
                SizedBox(
                  width: 64.w,
                  height: 64.h,
                  child:NetworkImageWidget(imageUrl: baseUrl+controller.cartList[index].catalogImage.toString(), imageHeight: 20.h,imageWidth:20.w,radiusAll: 6.r,),
                ),
                SizedBox(width: 10.w,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.cartList[index].name.toString(),maxLines:1,overflow:TextOverflow.ellipsis,style:textStyleDisplayMedium().copyWith(color: AppColors.primaryTextColor,fontWeight: FontWeight.w700,fontSize: 16.sp),),
                      Text(controller.cartList[index].itemCaption.toString(),maxLines:1,overflow:TextOverflow.ellipsis,style:textStyleDisplayMedium().copyWith(color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500,fontSize: 16.sp),),
                    ],
                  ),
                ),
                SizedBox(width: 10.w,),
                Container(
                  padding: EdgeInsets.all(2.h),
                  decoration: BoxDecoration(
                      color: AppColors.blueBgColor,
                      borderRadius: BorderRadius.circular(6.r)
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _circleButton(Icons.remove, (){
                        controller.decreaseProductQuantity(index);
                      }),
                       SizedBox(width: 12.w),
                      Obx(
                          ()=> Text(
                          controller.cartList[index].defaultQuantity.toString(),
                          style:textStyleDisplayMedium().copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500,color: AppColors.primaryTextColor),
                        ),
                      ),
                       SizedBox(width: 12.w),
                      _circleButton(Icons.add, (){
                        controller.increaseProductQuantity(index);
                      }),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text("\$${double.tryParse(controller.cartList[index].finalNetPrice.value.toString()??"0.0")?.toStringAsFixed(2)}",style:textStyleDisplayMedium().copyWith(color: AppColors.primaryTextColor,fontWeight: FontWeight.w400,fontSize: 14.sp),).paddingOnly(right: 15.w),
                controller.cartList[index].defaultDiscount?.id==null && !controller.promoCodeAppLied.value?SizedBox():Text("\$${double.tryParse(controller.cartList[index].currentDiscountedPrice.value.toString())?.toStringAsFixed(2)}",style:textStyleDisplayMedium().copyWith(decoration: TextDecoration.lineThrough,color: AppColors.primaryTextColor,fontWeight: FontWeight.w400,fontSize: 14.sp),),
                SizedBox(width: 10.w,),
                controller.cartList[index].defaultDiscount?.id==null?SizedBox():Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child:Text("\$${controller.cartList[index].defaultDiscount?.amount} ${keyOff.tr}",style:textStyleDisplayMedium().copyWith(color:AppColors.appColor,fontWeight: FontWeight.w500,fontSize: 14.sp),),
                ),
              ],
            ),
            controller.promoCodeAppLied.value?Container(
              padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child:Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.bookmark_border,color: AppColors.appColor,size:20.sp,),
                  Text("\$${controller.promoCodeData.value.amount} ${keyOff.tr}",style:textStyleDisplayMedium().copyWith(color:AppColors.appColor,fontWeight: FontWeight.w500,fontSize: 14.sp),),
                ],
              ),
            ):SizedBox(),
            SizedBox(height: 5.h,),


            Row(
              children: [
                Obx(
                () {
                  controller.cartList[index].isWaveTax.value;
                  return InkWell(
                    onTap: (){
                      CustomAlertDialog.show(
                        context: context,
                        title: '',
                        message: controller.cartList[index].isWaveTax.value?keyApplyTaxMessage.tr:keyWaiveTaxMessage.tr,
                        cancelText: keyNo.tr,
                        confirmText: keyYes.tr,
                        onConfirm: () {
                          Get.back();
                        controller.toggleWaivedTax(index);
                        },
                        onCancel: () {
                          Get.back();
                        }
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 4.h),
                      decoration: BoxDecoration(
                        color: controller.cartList[index].isWaveTax.value?Colors.green.withOpacity(0.2):AppColors.appColor,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child:Text( controller.cartList[index].isWaveTax.value?"\$${keyTaxWaived.tr}":keyTaxWaive.tr,style:textStyleDisplayMedium().copyWith(color:controller.cartList[index].isWaveTax.value?AppColors.appColor:Colors.white,fontWeight: FontWeight.w500,fontSize: 14.sp),),
                    ),
                  );
                },
                ),
                SizedBox(width: 10.w,),
                controller.cartList[index].defaultDiscount?.id==null?SizedBox():Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: AppColors.containerBorderGreyColor),
                  ),
                  child:Text("${controller.cartList[index].defaultDiscount?.discountCode} ${keyApplied.tr}",style:textStyleDisplayMedium().copyWith(color:AppColors.appColor,fontWeight: FontWeight.w500,fontSize: 14.sp),),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }


  _discountTextField() {
    return  Obx(
        ()=> Row(
        children: [
          controller.promoCodeAppLied.value?Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(color: AppColors.containerBorderGreyColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: Text("${keyPromo.tr} ${controller.promoCodeData.value.discountCode} ${keyApplied.tr}",textAlign:TextAlign.center,style:textStyleDisplayMedium().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500,color: Colors.green),)),
                InkWell(
                  onTap: (){
                    controller.removePromoCode();
                  },
                    child: Icon(Icons.cancel,color: Colors.red,size: 20.sp,).paddingOnly(left: 10.w))
              ],
            ),
          )):Expanded(
            child: TextFieldWidget(
              textController: controller.promoCodeTextController,
              hint: keyEnter.tr,
              decoration: null,
              isOutlined: false,
              prefixIcon: AssetImageWidget(
                AppImages.iconsDiscountIcon,
                imageHeight: 12.h,
              ).paddingSymmetric(vertical: 10.h, horizontal: 12.w),
            ).paddingSymmetric(vertical: 12.h),
          ),
          Obx(
          ()=> controller.promoCodeLoading.value?CircularProgressIndicator(color: AppColors.appColor).paddingOnly(left: 10.w):controller.promoCodeAppLied.value?SizedBox():InkWell(
              onTap: (){
                controller.checkPromoCodeApi(0);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.appColor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(keyApply.tr,textAlign:TextAlign.center,style:textStyleDisplayMedium().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500,color: Colors.white),),
              ),
            ).paddingOnly(left: 10.w),
          )
        ],
      ),
    );
  }

  

  _detailsContainer() {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
        color: AppColors.blueBgColor,
        borderRadius: BorderRadius.circular(6.r)
      ),

      child: Obx(
        () {
          final cart = controller.cartDetails();
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(keyDetails.tr,style: textStyleDisplayMedium().copyWith(color: AppColors.primaryTextColor,fontWeight: FontWeight.w700,fontSize: 20.sp),),
            _details(keyNetTotal.tr, cart.netTotal),
            _details(keyDiscounts.tr, cart.discount, color: Colors.green, operator: "-"),
            _details(keyTax.tr, cart.tax, color: Colors.red, operator: "+"),
            controller.isWaivedTax.value
                ? _details(keyTaxWaived.tr, cart.waivedTaxAmount, color: Colors.green, operator: "-")
                : SizedBox(),
            controller.promoCodeAppLied.value
                ? _details(keyPromoDiscount.tr, cart.promoDiscount, color: Colors.green, operator: "-")
                : SizedBox(),
            _details(keyTotal.tr, cart.total),

          ],
        );
        },
      )
    );
  }
 _details(String title,double amount,{Color color=AppColors.primaryTextColor,String operator=""}) {
     controller.cartDetails.value;
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$title:",style:textStyleDisplayMedium().copyWith(color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500,fontSize: 14.sp)),
        Text("$operator \$${double.tryParse(amount.toString())?.toStringAsFixed(2)}",style:textStyleDisplayMedium().copyWith(color: color,fontWeight: FontWeight.w700,fontSize: 14.sp)),
      ],
    ).paddingSymmetric(vertical: 10.h);
 }

  _bottomButton({Function()? onClickCallBack,bool isCheckOut=true}) {
    return InkWell(
      onTap: onClickCallBack,
      child: Container(
        height: 46.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color:isCheckOut?AppColors.appColor:AppColors.containerGreyColor,
            borderRadius: BorderRadius.circular(5.r)
        ),
        child: Center(child: Text(keyContinue.tr,style:textStyleBodyMedium().copyWith(color: Colors.white,fontWeight: FontWeight.w700),)),
      ),
    );
  }
}

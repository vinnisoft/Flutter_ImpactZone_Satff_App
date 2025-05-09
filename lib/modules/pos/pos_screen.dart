import 'package:impact_zone/export.dart';

class PosScreen extends GetView<PosController> {
  const PosScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitleText: keyPos.tr, actionWidget: [
        AssetImageWidget(
          AppImages.iconsNotification,
          imageHeight: 20.h,
        ),
      ],),
       body: SingleChildScrollView(
         child: Column(
           children: [

             Padding(
               padding:  EdgeInsets.symmetric(horizontal:20.h,vertical: 15.h),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 mainAxisSize: MainAxisSize.max,
                 children: [
                   _categories(),
                   SizedBox(height:15.h),
                   Obx(
                    ()=> _posLists(),
                   ),
                   SizedBox(height:20.h),
                   controller.categoryIndex>=0?SizedBox():_bottomButton(),

                 ],
               ),
             )
           ],
         ),
       ),
    );
  }


  _categories() {
    return Padding(
      padding:  EdgeInsets.only(top: 20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Text(keyWhatToSell.tr,style:textStyleHeadlineLarge()),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            height: 120.h,
            child:  ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_,i)=>SizedBox(width: 15.w,),
                itemCount: controller.iconItems.length,
                itemBuilder: (_,index) {
                  return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                    ()=> InkWell(
                        onTap: (){
                          controller.tapOnCategory(index);
                        },
                        child: Container(
                          height: 90.h,
                          width:90.w,
                          padding: EdgeInsets.all(20.h),
                          decoration: BoxDecoration(
                            color: controller.categoryIndex.value==index?Color(0xFFF0F3FF):Colors.white,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(color: controller.categoryIndex.value==index?AppColors.containerBorderColor:AppColors.containerBorderGreyColor)
                          ),
                          child:  AssetImageWidget(
                             controller.iconItems[index]['icon'].toString(),
                            imageHeight: 30.h,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Text(controller.iconItems[index]['title'].toString(),style:textStyleHeadlineSmall())
                  ],
                );
                },
              ),
          )

        ],
      ),
    );
  }

  _bottomButton({Function()? onClickCallBack}) {
    return InkWell(
      onTap: onClickCallBack,
      child: Container(
        height: 46.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: controller.categoryIndex>=0?AppColors.appColor:AppColors.containerGreyColor,
          borderRadius: BorderRadius.circular(5.r)
        ),
        child: Center(child: Text(keyContinue.tr,style:textStyleHeadlineSmall().copyWith(color: Colors.white,fontWeight: FontWeight.w700))),
      ),
    );
  }

  _posLists() {
     if(controller.categoryIndex.value==0){
       return Container(
         padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 15.h),
         decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(12.r),
             boxShadow: [
               BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 10.r)
             ]),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(keySelectServices.tr,style:textStyleHeadlineLarge(),),
             Obx(
                 () {
                   controller.selectedServices.length;
                   controller.serviceList.length;
                   return ListView.builder(
                   shrinkWrap: true,
                   padding: EdgeInsets.zero,
                   physics: NeverScrollableScrollPhysics(),
                   itemCount: controller.isInventoryCategoryLoading.value? 3:controller.serviceList.length,
                   itemBuilder: _itemList
               );
                 },
             ),
            SizedBox(height: 20.h,),
             _bottomButton(onClickCallBack: (){
               if(controller.selectedServices.isEmpty){
                 showToast(message: "Please select at least one service");
                 return;
               }
               Get.toNamed(AppRoutes.routeCartScreen,
               arguments:{
                 'cart_list':controller.serviceList,
                 'selected_cart_list':controller.selectedServices,
               }
               );
             }),
           ],
         ),
       );
     }
     else if(controller.categoryIndex.value==2){
       return Container(
         padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 15.h),
         decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(12.r),
             boxShadow: [
               BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 10.r)
             ]),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(keySelectMembershipPlan.tr,style:textStyleHeadlineLarge()),
             ListView.builder(
                 shrinkWrap: true,
                 padding: EdgeInsets.zero,
                 physics: NeverScrollableScrollPhysics(),
                 itemCount: controller.isInventoryCategoryLoading.value? 3:controller.inventoryCategoryList.length,
                 itemBuilder: _agreements
             ),
             SizedBox(height: 20.h,),
             _bottomButton(onClickCallBack: (){}),
           ],
         ),
       );
     }
     else if(controller.categoryIndex.value==1){
       return Container(
         padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 15.h),
         decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(12.r),
             boxShadow: [
               BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 10.r)
             ]),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(keySelectProducts.tr,style:textStyleHeadlineLarge(),),
             Obx(
                 () {
                   controller.selectedProducts.length;
                   return ListView.builder(
                   shrinkWrap: true,
                   padding: EdgeInsets.zero,
                   physics: NeverScrollableScrollPhysics(),
                   itemCount: controller.isInventoryCategoryLoading.value? 3:controller.inventoryCategoryList.length,
                   itemBuilder: _productItemList
               );
                 },
             ),
             SizedBox(height: 20.h,),
             _bottomButton(onClickCallBack: (){
                if(controller.selectedProducts.isEmpty){
                  showToast(message: "Please select at least one product");
                  return;
                }
               Get.toNamed(AppRoutes.routeCartScreen,
                   arguments:{
                     'cart_list':controller.inventoryCategoryList,
                     'selected_cart_list':controller.selectedProducts,
                   }
               );
             }),
           ],
         ),
       );
     }
     else{
       return SizedBox();
     }
  }

  Widget? _itemList(BuildContext context, int index) {
    if(controller.isInventoryCategoryLoading.value && controller.inventoryCategoryList.isEmpty){
      return  ShimmerEffect.inventoryCategoryShimmer();
    }
    bool isSelectedService = controller.selectedServices.contains(index);

    return Obx(
        () {
          controller.selectedServices.length;
          return Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(vertical: 6.h),
          decoration: BoxDecoration(
            border: Border.all(color: isSelectedService?AppColors.appColor:AppColors.containerBorderGreyColor),
            borderRadius: BorderRadius.circular(6.r)
          ),
          child: Row(
            children: [
              InkWell(
                onTap: (){
                  if(isSelectedService){
                    controller.selectedServices.remove(index);
                  }
                  else{
                    controller.selectedServices.add(index);
                  }
                },
                child: SizedBox(
                  width: 64.w,
                  height: 64.h,
                  child:NetworkImageWidget(imageUrl: baseUrl+controller.serviceList[index].catalogImage.toString(), imageHeight: 20.h,imageWidth:20.w,radiusAll: 6.r,),
                ),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.serviceList[index].name.toString(),maxLines:1,overflow:TextOverflow.ellipsis,style:textStyleHeadlineSmall().copyWith(fontWeight: FontWeight.w700)),
                    Text("\$${controller.serviceList[index].netPrice}",style:textStyleBodySmall().copyWith(fontWeight: FontWeight.w400,fontSize: 14.sp)),
                  ],
                ),
              ),
              isSelectedService?Container(
                padding: EdgeInsets.all(2),
                margin: EdgeInsets.only(left: 10.w),
                decoration: BoxDecoration(
                  color: AppColors.blueBgColor,
                  borderRadius: BorderRadius.circular(6.r)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _circleButton(Icons.remove, (){
                      controller.decreaseServiceQuantity(index);
                    }),
                     SizedBox(width: 12.w),
                    Obx(
                        ()=>Text(
                          controller.serviceList[index].defaultQuantity.value.toString(),
                        style:textStyleDisplayMedium().copyWith(fontSize: 16.sp),
                      ),
                    ),
                     SizedBox(width: 12.w),
                    _circleButton(Icons.add, (){
                      controller.increaseServiceQuantity(index);
                    }),
                  ],
                ),
              ):SizedBox(),
            ],
          ),
      );
        },
    );
  }


  Widget? _productItemList(BuildContext context, int index) {
    if(controller.isInventoryCategoryLoading.value && controller.inventoryCategoryList.isEmpty){
      return  ShimmerEffect.inventoryCategoryShimmer();
    }

    bool isSelectedService = controller.selectedProducts.contains(index);
    return Obx(
          () {
        controller.selectedProducts.length;
        return Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(vertical: 6.h),
          decoration: BoxDecoration(
              border: Border.all(color: isSelectedService?AppColors.appColor:AppColors.containerBorderGreyColor),
              borderRadius: BorderRadius.circular(6.r)
          ),
          child: Row(
            children: [
              InkWell(
                onTap: (){
                  if(isSelectedService){
                    controller.selectedProducts.remove(index);
                  }
                  else{
                    controller.selectedProducts.add(index);
                  }
                },
                child: SizedBox(
                  width: 64.w,
                  height: 64.h,
                  child:NetworkImageWidget(imageUrl: baseUrl+controller.inventoryCategoryList[index].catalogImage.toString(), imageHeight: 20.h,imageWidth:20.w,radiusAll: 6.r,),
                ),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.inventoryCategoryList[index].itemCaption.toString(),maxLines:1,overflow:TextOverflow.ellipsis,style:textStyleHeadlineSmall().copyWith(fontWeight: FontWeight.w700)),
                    Text("\$${controller.inventoryCategoryList[index].netPrice}",style:textStyleBodySmall().copyWith(fontWeight: FontWeight.w400,fontSize: 14.sp)),
                  ],
                ),
              ),
              isSelectedService?Container(
                padding: EdgeInsets.all(2),
                margin: EdgeInsets.only(left: 10.w),
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
                        controller.inventoryCategoryList[index].defaultQuantity.toString(),
                        style:textStyleDisplayMedium().copyWith(fontSize: 16.sp),
                      ),
                    ),
                     SizedBox(width: 12.w),
                    _circleButton(Icons.add, (){
                      controller.increaseProductQuantity(index);
                    }),
                  ],
                ),
              ):SizedBox(),
            ],
          ),
        );
      },
    );
  }
   Widget _circleButton(IconData icon, VoidCallback onPressed) {
     return InkWell(
       onTap: onPressed,
       borderRadius: BorderRadius.circular(24.r),
       child: Container(
         width: 20.w,
         height: 20.h,
         decoration: const BoxDecoration(
           color: AppColors.containerBorderColor, // dark blue like the image
           shape: BoxShape.circle,
         ),
         child: Icon(icon, color: Colors.white, size: 18.sp),
       ),
     );
   }

  Widget? _agreements(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.containerBorderGreyColor),
          borderRadius: BorderRadius.circular(6.r)
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("IMPACT 1",style:textStyleHeadlineSmall().copyWith(fontWeight: FontWeight.w700)),
              Text("\$56",style:textStyleBodySmall().copyWith(fontWeight: FontWeight.w400,fontSize: 14.sp)),
            ],
          ),
          Expanded(child: SizedBox()),
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: AppColors.blueBgColor,
                borderRadius: BorderRadius.circular(6.r)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _circleButton(Icons.remove, (){}),
                 SizedBox(width: 12.w),
                Text(
                  '6',
                  style: textStyleDisplayMedium().copyWith(fontSize: 16.sp),
                ),
                 SizedBox(width: 12.w),
                _circleButton(Icons.add, (){}),
              ],
            ),
          ),
        ],
      ),
    );
  }


}

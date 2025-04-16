import 'package:impact_zone/export.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

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
        ),
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
            BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(keyItem.tr,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: AppColors.primaryTextColor),),
         ListView.builder(
           physics: NeverScrollableScrollPhysics(),
             shrinkWrap: true,
             padding: EdgeInsets.zero,
             itemCount: 2,
             itemBuilder:_items
         ),
          Divider(color: AppColors.containerGreyColor,).paddingSymmetric(vertical: 10.h),
          Text(keyMember.tr,style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w500,fontSize: 16),),
          // UserDropdown(),
          CustomDropdown2(dropdownItems: [
            {
              "name": "Alex Linderson",
              "image": "assets/images/user1.jpg",
            },
            {
              "name": "Austin Mahone",
              "image": "assets/images/user2.jpg",
            },
            {
              "name": "John Ahraham",
              "image": "assets/images/user3.jpg",
            },
            {
              "name": "Sabila Sayma",
              "image": "assets/images/user4.jpg",
            },
            {
              "name": "John Borino",
              "image": "assets/images/user5.jpg",
            },
            {
              "name": "Angel Dayna",
              "image": "assets/images/user6.jpg",
            },
          ],
            onChanged: (I) {  },
            radius: 6.r,

          ),
          Divider(color: AppColors.containerGreyColor,).paddingSymmetric(vertical: 10.h),
          Text(keyDiscount.tr,style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w500,fontSize: 16),),
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
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 20,
        height: 20,
        decoration: const BoxDecoration(
          color: AppColors.containerBorderColor, // dark blue like the image
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }

  Widget? _items(BuildContext context, int index) {
    return   Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.containerBorderGreyColor),
          borderRadius: BorderRadius.circular(6.r)
      ),
      child: Row(
        children: [
          SizedBox(
            width: 64.w,
            height: 64.h,
            child: AssetImageWidget(
              "assets/images/temp_gym.png",
              imageHeight: 20.h,
              radiusAll: 6.r,
            ),
          ),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Service 1",style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w700,fontSize: 16),),
              Text("\$56",style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w400),),
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
                const SizedBox(width: 12),
                Text(
                  '6',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: AppColors.primaryTextColor),
                ),
                const SizedBox(width: 12),
                _circleButton(Icons.add, (){}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _discountTextField() {
    return  TextFieldWidget(
      hint: keyEnter.tr,
      prefixIcon: AssetImageWidget(
        AppImages.iconsDiscountIcon,
        imageHeight: 12.h,
      ).paddingSymmetric(vertical: 10.h, horizontal: 12.w),
      suffix:Text(keyApply.tr,textAlign:TextAlign.center,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.primaryTextColor),),
    ).paddingSymmetric(vertical: 12.h);
  }

  _detailsContainer() {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
        color: AppColors.blueBgColor,
        borderRadius: BorderRadius.circular(6.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(keyDetails.tr,style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w700,fontSize: 20),),
          _details(keyDiscounts.tr),
          _details(keyTax.tr),
          _details(keyTotal.tr),
        ],
      ),
    );
  }

 _details(String title){
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500,fontSize: 14)),
        Text("\$2.00",style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w700,fontSize: 14)),
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
        child: Center(child: Text(keyContinue.tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)),
      ),
    );
  }
}

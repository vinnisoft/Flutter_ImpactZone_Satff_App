import 'package:impact_zone/export.dart';



class CartController extends GetxController{
  final APIRepository _repository = Get.find<APIRepository>();
  RxBool isMembersListApiCall = false.obs;
  Rx<MemberListResponseModel> memberListResponse = MemberListResponseModel().obs;
  RxList<InventoryItem> cartList = <InventoryItem>[].obs;
  RxList<int> selectedCartList = <int>[].obs;
  RxList<MemberModel> myMemberList = <MemberModel>[].obs;
  RxList<String> myMemberList2 = <String>[].obs;
  RxList<Map<String, dynamic>> users = <Map<String, dynamic>>[].obs;
  TextEditingController promoCodeTextController = TextEditingController();
  RxBool promoCodeLoading = false.obs;

  /////////////////////////////////////////////////////////////////////////
  RxDouble currentPrice = 0.0.obs;
  RxDouble currentDiscountedPrice = 0.0.obs;
  RxDouble itemTotalPrice= 0.0.obs;
  RxDouble netTotal = 0.0.obs;
  RxDouble taxAmount = 0.0.obs;
  RxDouble discount = 0.0.obs;
  RxDouble finalTotal = 0.0.obs;
  double defaultDiscount=0.0;
  RxDouble waivedTaxAmount=0.0.obs;
  RxBool isWaivedTax = false.obs;
  RxBool promoCodeAppLied = false.obs;
  RxDouble promoCodeDiscountAmount=0.0.obs;
  Rx<PromoCodeResponse> promoCodeResponseData = PromoCodeResponse().obs;
  Rx<PromoCodeData> promoCodeData = PromoCodeData().obs;
  RxInt condition = 0.obs;
  Rx<CartDetails> cartDetails = CartDetails().obs;


  @override
  void onInit() {
    cartDetails.value= CartDetails();
    if (Get.arguments != null) {
    cartList = Get.arguments['cart_list'];
    selectedCartList = Get.arguments['selected_cart_list'];
  }

    getMembersAPi();
    super.onInit();
  }


@override
  void onReady() {
    super.onReady();
  }



  getMembersAPi() {
    _repository.membersListApiCall().then((value) async {
      if (value != null) {
        memberListResponse.value = value;
        if(memberListResponse.value.data != null){
          myMemberList.value = memberListResponse.value.data ?? [];
          myMemberList2=myMemberList.map((e) => e.firstName!).toList().obs;
        }
      }
      update();
    }).onError((error, stackTrace) {
      // isLoading.value = false;
      showToast(message: error.toString());
    });
  }


  getPrice(index){

    cartDetails.value = cartDetails.value.copyWith(
      netTotal: cartDetails.value.netTotal + (double.tryParse(cartList[index].netPrice.toString()) ?? 0.0),
    );



    if(cartList[index].allowDiscount==true){
      if(cartList[index].defaultDiscount!=null){
        cartDetails.value = cartDetails.value.copyWith(
          discount: cartDetails.value.discount +
              (double.tryParse(cartList[index].defaultDiscount?.amount.toString() ?? "0.0") ?? 0.0),
        );

      }

      cartList[index].finalNetPrice.value=(cartList[index].netPrice??0.0)-(cartList[index].defaultDiscount?.amount??0.0);
      cartList[index].totalTax.value=getDiscount(actualPrice: cartList[index].finalNetPrice.value??0.0 ,taxPercentage:cartList[index].taxes![0].taxRatePercentage??0.0 );
      cartDetails.value = cartDetails.value.copyWith(
        tax:(cartList[index].totalTax.value ?? 0.0),
      );
      if(isWaivedTax.value==true){
       waivedTaxAmount.value=cartList[index].totalTax.value;
      }
      if(cartList[index].defaultDiscount!=null){
        cartList[index].defaultDiscount!.amount=double.tryParse(cartList[index].defaultDiscount!.amount.toString())!;
      }
      else{
        cartList[index].defaultDiscount!.amount=0.0;
      }

    }
    cartDetails.value = cartDetails.value.copyWith(
      total: (cartDetails.value.netTotal + cartDetails.value.tax) - cartDetails.value.discount,
    );
    if(isWaivedTax.value==true){
      cartDetails.value = cartDetails.value.copyWith(
        total: cartDetails.value.total - cartDetails.value.discount,
      );

    }
    cartList[index].currentDiscountedPrice.value=cartList[index].netPrice??0.0;
    cartList[index].finalNetPrice.value=(cartList[index].netPrice??0.0)-(cartList[index].defaultDiscount?.amount??0.0);
    cartList[index].finalTotal.value=cartList[index].finalNetPrice.value??0.0;


    if(cartList.length==index+1){
     getCartDetails();
    }

  }


  double getDiscount({ required double actualPrice,required double taxPercentage}){
    return actualPrice*(taxPercentage/100);
  }

  decreaseProductQuantity(int index){

    if(cartList[index].defaultQuantity.value==1){
      return;
    }

    cartList[index].defaultQuantity=cartList[index].defaultQuantity-1;

    if(cartList[index].defaultQuantity.value==double.parse(cartList[index].moreThan1.toString())) {
      cartList[index].currentDiscountedPrice.value=
         cartList[index].netPrice!;
      cartList[index].finalNetPrice.value =cartList[index].currentDiscountedPrice.value- (cartList[index].defaultDiscount!.amount??0.0);
      if (promoCodeAppLied.value == true) {
        cartList[index].finalNetPrice.value =
            (cartList[index].finalNetPrice.value??0.0) - (promoCodeData.value.amount ?? 0);
      }
    }

    if(cartList[index].defaultQuantity.value==double.parse(cartList[index].moreThan2.toString())) {
      if (cartList[index].unitDiscount2 != 0) {
        cartList[index].currentDiscountedPrice.value =
        (cartList[index].netPrice! - double.parse(
            cartList[index].unitDiscount1.toString()));
        cartList[index].finalNetPrice.value = cartList[index].currentDiscountedPrice.value - (cartList[index].defaultDiscount!.amount??0.0);
        if (promoCodeAppLied.value == true) {
          cartList[index].finalNetPrice.value =
              (cartList[index].finalNetPrice.value??0.0) - (promoCodeData.value.amount ?? 0);
        }
      }
    }


    if(cartList[index].defaultQuantity.value==double.parse(cartList[index].moreThan3.toString())) {
      if(cartList[index].unitDiscount3!=0) {
        cartList[index].currentDiscountedPrice.value =
        (cartList[index].netPrice! - double.parse(
            cartList[index].unitDiscount2.toString()));
        cartList[index].finalNetPrice.value = cartList[index].currentDiscountedPrice.value- (cartList[index].defaultDiscount!.amount??0.0);
        if (promoCodeAppLied.value == true) {
          cartList[index].finalNetPrice.value =
              (cartList[index].finalNetPrice.value??0.0) - (promoCodeData.value.amount ?? 0);
        }

      }

    }

    condition.value--;
    cartList[index].finalTotal.value=(cartList[index].finalNetPrice.value??0.0)*cartList[index].defaultQuantity.value;
    cartList[index].totalTax.value=getDiscount(taxPercentage:cartList[0].taxes![0].taxRatePercentage??0.0 ,actualPrice:cartList[index].finalTotal.value );
    cartDetails.value = cartDetails.value.copyWith(
      tax: (cartList[index].totalTax.value ?? 0.0),
    );
    if(cartList[index].allowDiscount==true){
      cartDetails.value = cartDetails.value.copyWith(
        discount: (double.tryParse(cartList[index].defaultDiscount?.amount.toString() ?? "0.0") ?? 0.0) *
            (cartList[index].defaultQuantity.value),
      );

    }
    cartDetails.value = cartDetails.value.copyWith(netTotal: cartList[index].currentDiscountedPrice.value * cartList[index].defaultQuantity.value);

    cartDetails.value = cartDetails.value.copyWith(total: (cartDetails.value.netTotal + cartList[index].totalTax.value) - cartDetails.value.discount);

    if(cartList[index].isWaveTax.value==true){
      cartDetails.value = cartDetails.value.copyWith(total: cartDetails.value.total - cartList[index].totalTax.value);

    }

    if(promoCodeAppLied.value==true){
      promoCodeDiscountAmount.value=((promoCodeData.value.amount ?? 0)*cartList[index].defaultQuantity.value).toDouble();
      cartDetails.value = cartDetails.value.copyWith(total: cartDetails.value.total - promoCodeDiscountAmount.value,
        promoDiscount: promoCodeDiscountAmount.value,
      );

    }

    if(selectedCartList.length>1){
      getCartDetails();
    }

  }




  increaseProductQuantity(int index){
    cartList[index].defaultQuantity=cartList[index].defaultQuantity+1;
    condition.value++;
      if(cartList[index].defaultQuantity.value>double.parse(cartList[index].moreThan1.toString())) {
        cartList[index].currentDiscountedPrice.value=
        (cartList[index].netPrice! - double.parse(
            cartList[index].unitDiscount1.toString()));
        cartList[index].finalNetPrice.value =cartList[index].currentDiscountedPrice.value - (cartList[index].defaultDiscount!.amount??0.0);
        if (promoCodeAppLied.value == true) {
          cartList[index].finalNetPrice.value =
              (cartList[index].finalNetPrice.value??0.0) - (promoCodeData.value.amount ?? 0);
        }
      }

      if(cartList[index].defaultQuantity.value>double.parse(cartList[index].moreThan2.toString())) {
        if (cartList[index].unitDiscount2 != 0) {
          cartList[index].currentDiscountedPrice.value =
          (cartList[index].netPrice! - double.parse(
              cartList[index].unitDiscount2.toString()));
          cartList[index].finalNetPrice.value =cartList[index].currentDiscountedPrice.value - (cartList[index].defaultDiscount!.amount??0.0);
          if (promoCodeAppLied.value == true) {
            cartList[index].finalNetPrice.value =
                (cartList[index].finalNetPrice.value??0.0) - (promoCodeData.value.amount ?? 0);
          }
        }
      }

      if(cartList[index].defaultQuantity.value>double.parse(cartList[index].moreThan3.toString())) {
      if(cartList[index].unitDiscount3!=0) {
        cartList[index].currentDiscountedPrice.value =
        (cartList[index].netPrice! - double.parse(
            cartList[index].unitDiscount3.toString()));
        cartList[index].finalNetPrice.value = cartList[index].currentDiscountedPrice.value- (cartList[index].defaultDiscount!.amount??0.0);
        if (promoCodeAppLied.value == true) {
          cartList[index].finalNetPrice.value =
              (cartList[index].finalNetPrice.value??0.0) - (promoCodeData.value.amount ?? 0);
        }
      }


    }


    cartList[index].finalTotal.value = double.parse(double.tryParse((cartList[index].finalNetPrice.value??0.0).toString())?.toStringAsFixed(2) ?? '0') * cartList[index].defaultQuantity.value;
    cartList[index].totalTax.value=getDiscount(taxPercentage:cartList[index].taxes![0].taxRatePercentage??0.0 ,actualPrice:cartList[index].finalTotal.value );
    cartDetails.value = cartDetails.value.copyWith(
      tax: (cartList[index].totalTax.value ?? 0.0),
    );
    if(cartList[index].allowDiscount==true){
      if(cartList[index].defaultDiscount!=null){
        cartDetails.value = cartDetails.value.copyWith(
          discount: (double.tryParse(cartList[index].defaultDiscount?.amount.toString() ?? "0.0") ?? 0.0) * cartList[index].defaultQuantity.value,
        );

      }
    }
    cartDetails.value = cartDetails.value.copyWith(
      netTotal: cartList[index].currentDiscountedPrice.value * cartList[index].defaultQuantity.value,
      total: (cartList[index].currentDiscountedPrice.value * cartList[index].defaultQuantity.value + cartList[index].totalTax.value) - cartDetails.value.discount,
    );

    if(cartList[index].isWaveTax.value==true){
      cartDetails.value = cartDetails.value.copyWith(
        total: cartDetails.value.total - cartList[index].totalTax.value,
      );

    }
    if(promoCodeAppLied.value==true){
      promoCodeDiscountAmount.value=((promoCodeData.value.amount ?? 0)*cartList[index].defaultQuantity.value).toDouble();
      cartDetails.value = cartDetails.value.copyWith(
        total: cartDetails.value.total - promoCodeDiscountAmount.value,
        promoDiscount: promoCodeDiscountAmount.value,

      );

    }

    if(selectedCartList.length>1){
    getCartDetails();
    }
  }



  // Waived Tax
  toggleWaivedTax(int index) {
    cartList[index].isWaveTax.value =!cartList[index].isWaveTax.value;
    waivedTaxAmount.value=cartList[index].totalTax.value;
    if (isWaivedTax.value) {
      cartDetails.value = cartDetails.value.copyWith(
        total: cartDetails.value.total - waivedTaxAmount.value,
      );

    } else {
      cartDetails.value = cartDetails.value.copyWith(
        total: cartDetails.value.total + waivedTaxAmount.value,
      );

    }

    getCartDetails();
  }




  checkPromoCodeApi(int index) {
    promoCodeLoading.value = true;
    Map<String, dynamic> requestModel ={
      "promoCode": promoCodeTextController.text.trim(),
    };
    _repository.checkPromoCodeApiCall(dataBody: requestModel).then((value) async {
      if (value != null) {
        if(value.success==true){
          promoCodeResponseData.value = value;
          if(promoCodeResponseData.value.data != null){
            promoCodeData.value = promoCodeResponseData.value.data ?? PromoCodeData();
            promoCodeAppLied.value=true;
            applyPromoCode();

          }
        }
        else{
          promoCodeAppLied.value=false;
        }
        showToast(message:value.message.toString());
      }
      promoCodeLoading.value = false;
    }).onError((error, stackTrace) {
      showToast(message: error.toString());
      promoCodeLoading.value = false;
    });
  }


  // Remove Promo Code
  removePromoCode() {
    promoCodeTextController.clear();
    promoCodeAppLied.value=false;

    for (int index = 0; index < cartList.length; index++) {
      if (selectedCartList.contains(index)) {
        cartList[index].finalNetPrice.value=(cartList[index].finalNetPrice.value)+promoCodeData.value.amount!;
        cartList[index].finalTotal.value=(cartList[index].finalNetPrice.value)*cartList[index].defaultQuantity.value;
        cartList[index].totalTax.value=getDiscount(taxPercentage:cartList[index].taxes![0].taxRatePercentage??0.0 ,actualPrice:cartList[index].finalTotal.value );
        cartDetails.value = cartDetails.value.copyWith(
          tax:cartList[index].defaultQuantity.value*(cartList[index].totalTax.value),
        );
        cartDetails.value = cartDetails.value.copyWith(
          total: (cartDetails.value.netTotal-cartDetails.value.discount+cartDetails.value.tax),
        );
      }
    }
    getCartDetails();


  }

  @override
  void dispose() {
    cartDetails.value= CartDetails();
    super.dispose();
  }

  void getCartDetails() {
    cartDetails.value = cartDetails.value.copyWith(
      tax:0.0,
      discount:0.0,
      netTotal:0.0,
      total:0.0,
    );
    double totalTax = 0.0;
    double discount2 = 0.0;
    double netWorth = 0.0;
    double waivedTax = 0.0;
    double promoCodeDiscount = 0.0;

    for (int i = 0; i < cartList.length; i++) {
      if (selectedCartList.contains(i)) {

        totalTax += cartList[i].totalTax.value;
        if(cartList[i].isWaveTax.value==true){
          waivedTax+= cartList[i].totalTax.value;
        }
        if(promoCodeAppLied.value){
          promoCodeDiscount += ((promoCodeData.value.amount ?? 0) * cartList[i].defaultQuantity.value);
        }
        discount2 += (double.parse(cartList[i].defaultDiscount?.amount.toString()?? "0.0")* cartList[i].defaultQuantity.value);
        if((cartList[i].defaultDiscount?.amount??0.0)>0){
          netWorth += double.parse(cartList[i].currentDiscountedPrice.toStringAsFixed(2))* cartList[i].defaultQuantity.value;
        }
        else{
          if(promoCodeAppLied.value){
            netWorth += cartList[i].currentDiscountedPrice * cartList[i].defaultQuantity.value;
          }
          else{
            netWorth += cartList[i].finalNetPrice * cartList[i].defaultQuantity.value;
          }

        }
      }
    }

      cartDetails.value = cartDetails.value.copyWith(tax: totalTax,
        discount: discount2,
        netTotal:netWorth ,
        promoDiscount: promoCodeDiscount,
        total: (((totalTax-waivedTax)-promoCodeDiscount) + netWorth) - discount2,
      );


  }


  applyPromoCode(){

    for (int index = 0; index < cartList.length; index++) {
      if (selectedCartList.contains(index)) {
        cartList[index].finalNetPrice.value=(cartList[index].finalNetPrice.value??0.0)-promoCodeData.value.amount!;
        cartList[index].finalTotal.value=(cartList[index].finalNetPrice.value??0.0)*cartList[index].defaultQuantity.value;
        cartList[index].totalTax.value=getDiscount(taxPercentage:cartList[index].taxes![0].taxRatePercentage??0.0 ,actualPrice:cartList[index].finalTotal.value );
        cartDetails.value = cartDetails.value.copyWith(
          tax:(cartList[index].totalTax.value ?? 0.0),
        );
        cartDetails.value = cartDetails.value.copyWith(
          total: (cartDetails.value.netTotal + cartList[index].totalTax.value) - cartDetails.value.discount,
        );

        promoCodeDiscountAmount.value=((promoCodeData.value.amount ?? 0)*cartList[index].defaultQuantity.value).toDouble();
        cartDetails.value = cartDetails.value.copyWith(
          total: (cartDetails.value.total - promoCodeDiscountAmount.value+cartDetails.value.tax) - cartList[index].totalTax.value,
        );
      }
    }
      getCartDetails();

  }

}


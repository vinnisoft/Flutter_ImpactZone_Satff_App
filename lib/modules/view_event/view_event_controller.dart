import '../../export.dart';


class ViewEventController extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();

  RxBool isBookingDetailLoading = false.obs;
  RxString bookingId = ''.obs;

  Rx<BookingDetailResponseModel> bookingDetailResponse = BookingDetailResponseModel().obs;
  Rx<BookingDetailDataModel> bookingData = BookingDetailDataModel().obs;

  RxString title=''.obs;
  @override
  void onInit() {
    if (Get.arguments != null) {
      bookingId.value = Get.arguments['booking_id'];
      title.value = Get.arguments['title'];
    }
    getBookingDetails();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getBookingDetails() {
    isBookingDetailLoading.value = true;
    _repository.bookingDetailsApiCall(id:bookingId.value).then((value) {
      isBookingDetailLoading.value = false;
      if (value != null) {
        bookingDetailResponse.value = value;
        if (bookingDetailResponse.value.data != null) {
          bookingData.value = bookingDetailResponse.value.data!;
        }
      }
    }).catchError((error) {
      isBookingDetailLoading.value = false;
    });
  }


}
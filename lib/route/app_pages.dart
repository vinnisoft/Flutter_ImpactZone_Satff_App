import 'package:impact_zone/export.dart';
import 'package:impact_zone/modules/cart/cart_binding.dart';
import 'package:impact_zone/modules/cart/cart_screen.dart';
import 'package:impact_zone/modules/chat/chat_module/chat_binding.dart';
import 'package:impact_zone/modules/chat/chat_module/chat_screen.dart';
import 'package:impact_zone/modules/checkout/checkout_screen.dart';
import 'package:impact_zone/modules/members/members_screen.dart';
import 'package:impact_zone/modules/notification/notification_bindings.dart';
import 'package:impact_zone/modules/notification/notification_screen.dart';
import 'package:impact_zone/modules/pay_later/pay_later_binding.dart';
import 'package:impact_zone/modules/pay_later/pay_later_screen.dart';
import 'package:impact_zone/modules/pos/pos_bindings.dart';
import 'package:impact_zone/modules/pos/pos_screen.dart';
import 'package:impact_zone/modules/pos_card_on_file/pos_card_on_file_binding.dart';
import 'package:impact_zone/modules/pos_card_on_file/pos_card_on_file_screen.dart';
import 'package:impact_zone/modules/pos_checkout_details/pos_checkout_details_screen.dart';
import 'package:impact_zone/modules/pre_pay/pos_pre_pay_binding.dart';
import 'package:impact_zone/modules/pre_pay/pos_pre_pay_screen.dart';
import 'package:impact_zone/modules/todo_details/to_do_task_details_binding.dart';
import 'package:impact_zone/modules/todo_details/todo_task_details.dart';

import '../modules/checkout/checkout_binding.dart';
import '../modules/members/member_list_binding.dart';
import '../modules/pos_card_on_file/add_new_card.dart';
import '../modules/pos_checkout_details/pos_checkout_details_binding.dart';

class AppPages {
  AppPages();

  static const int _transitionDuration = 300;
  static const initial = AppRoutes.routeSplash;

  static var pages = <GetPage>[
    GetPage(
        name: AppRoutes.routeSplash,
        transition: Transition.rightToLeft,
        curve: Curves.ease,
        transitionDuration: const Duration(milliseconds: _transitionDuration),
        page: () => const SplashScreen()),
    GetPage(
      name: AppRoutes.routeOnBoarding,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => const OnBoardingScreen(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: AppRoutes.routeLogin,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.routeForgotPassword,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.routeOtpVerification,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => OtpVerificationScreen(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: AppRoutes.routeResetPassword,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => ResetPasswordScreen(),
      binding: RestPasswordBinding(),
    ),

    GetPage(
      name: AppRoutes.routeDashboard,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),

    GetPage(
      name: AppRoutes.routeMyAppointments,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => MyAppointmentsScreen(),
      binding: MyAppointmentsBinding(),
    ),
    GetPage(
      name: AppRoutes.routeMyAppointmentDetail,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => MyAppointmentDetailScreen(),
      binding: MyAppointmentDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.routeToDoTasksList,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => ToDoTaskScreen(),
      binding: ToDoTaskBinding(),
    ),

    GetPage(
      name: AppRoutes.routeMemberDetail,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => MemberDetailScreen(),
      binding: MemberDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.routeTodoDescription,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => TodoTaskDetails(),
      binding: ToDoTaskDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.routeMembersScreen,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => MembersScreen(),
      binding: MemberListBinding(),
    ),

    GetPage(
      name: AppRoutes.routePosScreen,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => PosScreen(),
      binding: PosBindings(),
    ),

    GetPage(
      name: AppRoutes.routeCartScreen,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => CartScreen(),
      binding: CartBinding(),
    ),

    GetPage(
      name: AppRoutes.routeCheckOutScreen,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => CheckoutScreen(),
      binding: CheckoutBinding(),
    ),

    GetPage(
      name: AppRoutes.routePosCheckoutDetailsScreen,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => PosCheckoutDetailsScreen(),
      binding: PosCheckoutDetailsBinding(),
    ),
   GetPage(
      name: AppRoutes.routePosCardOnFileScreen,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => PosCardOnFileScreen(),
      binding: PosCardOnFileBinding(),
    ),

    GetPage(
      name: AppRoutes.routePosAddNewScreen,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => AddNewCardScreen(),
      binding: PosCardOnFileBinding(),
    ),

    GetPage(
      name: AppRoutes.routePrePayScreen,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => PosPrePayScreen(),
      binding: PosPrePayBinding(),
    ),
    GetPage(
      name: AppRoutes.routePayLaterScreen,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => PayLaterScreen(),
      binding: PayLaterBinding(),
    ),
    GetPage(
      name: AppRoutes.routeChatScreen,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => ChatScreen(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.routeNotificationScreen,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => NotificationScreen(),
      binding: NotificationBindings(),
    ),
  ];
}

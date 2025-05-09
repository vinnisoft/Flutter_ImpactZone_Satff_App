import 'package:impact_zone/export.dart';

import '../modules/book_event/book_event_screen.dart';
export 'package:impact_zone/modules/edit_booking/edit_booking_screen.dart';


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
    GetPage(
      name: AppRoutes.routeReportScreen,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => ReportScreen(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: AppRoutes.routeChangePasswordScreen,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => ChangePasswordScreen(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.routeTimeSheetScreen,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => TimeSheetScreen(),
      binding: TimeSheetBinding(),
    ),
    GetPage(
      name: AppRoutes.routeBookEventScreen,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => BookEventScreen(),
      binding: BookEventBinding(),
    ),

    GetPage(
      name: AppRoutes.routeViewEventScreen,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => ViewEventScreen(),
      binding: ViewEventBinding(),
    ),

    GetPage(
      name: AppRoutes.routeEditEventScreen,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => EditBookingScreen(),
      binding: EditBookingBinding(),
    ),
  ];
}

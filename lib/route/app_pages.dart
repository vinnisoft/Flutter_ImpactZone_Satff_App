import 'package:impact_zone/export.dart';

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


  ];
}

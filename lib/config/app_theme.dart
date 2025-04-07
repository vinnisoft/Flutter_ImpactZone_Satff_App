import 'package:impact_zone/export.dart';

class ThemeConfig {
  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    Color? secondaryText,
    required Color accentColor,
    Color? divider,
    Color? buttonBackground,
    required Color buttonText,
    Color? cardBackground,
    Color? disabled,
    required Color error,
  }) {
    return ThemeData(
      brightness: brightness,
      canvasColor: background,
      primaryColorDark: Colors.white,
      cardColor: background,
      dividerColor: divider,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
      dividerTheme: DividerThemeData(
        color: divider,
        space: 1,
        thickness: 1,
      ),
      cardTheme: CardTheme(
        color: cardBackground,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
      primaryColor: accentColor,
      colorScheme: ColorScheme.fromSwatch(
          backgroundColor: background,
          errorColor: error,
          accentColor: accentColor,
          brightness: brightness),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: accentColor,
        selectionHandleColor: accentColor,
        cursorColor: accentColor,
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: brightness),
        color: AppColors.secondaryAppColor,
        toolbarTextStyle: TextStyle(
          color: secondaryText,
          fontSize: 18.0.sp,
        ),
        iconTheme: IconThemeData(color: Colors.black, size: 25.h),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 25.h,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: AppColors.appColor,
          primaryContainer: accentColor,
          secondary: accentColor,
          secondaryContainer: accentColor,
          surface: background,
          error: error,
          onPrimary: buttonText,
          onSecondary: buttonText,
          onSurface: buttonText,
          onError: buttonText,
        ),
        padding: EdgeInsets.all(16.h),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: accentColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1.w),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1.w),
        ),
        errorStyle: TextStyle(color: error),
        labelStyle: TextStyle(
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: primaryText.withOpacity(0.5),
        ),
      ),
      fontFamily: 'Satoshi',
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 25.sp,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 22.sp,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w700,
        ),
        displaySmall: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 18.sp,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w600,
        ),
        headlineLarge: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 20.sp,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 18.sp,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 16.sp,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 16.sp,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 15.sp,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w600,
        ),
        labelSmall: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 14.sp,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: AppColors.secondaryTextColor,
          fontSize: 14.sp,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: AppColors.secondaryTextColor,
          fontSize: 13.sp,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: AppColors.secondaryTextColor,
          fontSize: 12.sp,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 15.sp,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 14.sp,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 13.sp,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }


  static ThemeData get lightTheme => createTheme(
        brightness: Brightness.light,
        background: Colors.white,
        cardBackground: Colors.white,
        primaryText: Colors.white,
        secondaryText: Colors.black,
        accentColor: Colors.transparent,
        divider: Colors.black45,
        buttonBackground: Colors.white,
        buttonText: Colors.black,
        disabled: Colors.black,
        error: Colors.red,
      );
}

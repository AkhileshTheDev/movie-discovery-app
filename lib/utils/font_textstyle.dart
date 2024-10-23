import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class FontTextStyle {
  static const fontFamily = "Gsothic";

  static FontWeight light = FontWeight.w100;
  static FontWeight regular = FontWeight.w200;
  static FontWeight medium = FontWeight.w300;
  static FontWeight semiBold = FontWeight.w400;
  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w900;

  static TextStyle textFieldStyle(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      color: AppColors.textBlack,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
    );
  }

  ///************* Error Text Style *******************************************************
  static TextStyle errorTextStyle(Color fontColor) {
    return TextStyle(
      fontSize: 18,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: semiBold,
    );
  }

  ///************* light *******************************************************
  static TextStyle textStyle24light(Color fontColor) {
    return TextStyle(
      fontSize: 24,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: light,
    );
  }

  static TextStyle textStyle22light(Color fontColor) {
    return TextStyle(
      fontSize: 22,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: light,
    );
  }

  static TextStyle textStyle20light(Color fontColor) {
    return TextStyle(
      fontSize: 20,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: light,
    );
  }

  static TextStyle textStyle18light(Color fontColor) {
    return TextStyle(
      fontSize: 18,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: light,
    );
  }

  static TextStyle textStyle16light(Color fontColor) {
    return TextStyle(
      fontSize: 16,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: light,
    );
  }

  static TextStyle textStyle14light(Color fontColor) {
    return TextStyle(
      fontSize: 14,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: light,
    );
  }

  static TextStyle textStyle12light(Color fontColor) {
    return TextStyle(
      fontSize: 12,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: light,
    );
  }

  static TextStyle textStyle10light(Color fontColor) {
    return TextStyle(
      fontSize: 10,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: light,
    );
  }

  static TextStyle textStyle8light(Color fontColor) {
    return TextStyle(
      fontSize: 8,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: light,
    );
  }

  ///************* regular *******************************************************

  static TextStyle textStyle24reg(Color fontColor) {
    return TextStyle(
      fontSize: 24,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: regular,
    );
  }

  static TextStyle textStyle22reg(Color fontColor) {
    return TextStyle(
      fontSize: 22,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: regular,
    );
  }

  static TextStyle textStyle20reg(Color fontColor) {
    return TextStyle(
      fontSize: 20,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: regular,
    );
  }

  static TextStyle textStyle18reg(Color fontColor) {
    return TextStyle(
      fontSize: 18,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: regular,
    );
  }

  static TextStyle textStyle16reg(Color fontColor) {
    return TextStyle(
      fontSize: 16,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: regular,
    );
  }

  static TextStyle textStyle14reg(Color fontColor) {
    return TextStyle(
      fontSize: 14,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: regular,
    );
  }

  static TextStyle textStyle12reg(Color fontColor) {
    return TextStyle(
      fontSize: 12,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: regular,
    );
  }

  static TextStyle textStyle10reg(Color fontColor) {
    return TextStyle(
      fontSize: 10,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: regular,
    );
  }

  static TextStyle textStyle8reg(Color fontColor) {
    return TextStyle(
      fontSize: 8,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: regular,
    );
  }

  ///************* medium *******************************************************

  static TextStyle textStyle24med(Color fontColor) {
    return TextStyle(
      fontSize: 24,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: medium,
    );
  }

  static TextStyle textStyle21med(Color fontColor) {
    return TextStyle(
      fontSize: 21,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: medium,
    );
  }

  static TextStyle textStyle22med(Color fontColor) {
    return TextStyle(
      fontSize: 22,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: medium,
    );
  }

  static TextStyle textStyle20med(Color fontColor) {
    return TextStyle(
      fontSize: 20,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: medium,
    );
  }

  static TextStyle textStyle18med(Color fontColor) {
    return TextStyle(
      fontSize: 18,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: medium,
    );
  }

  static TextStyle textStyle16med(Color fontColor) {
    return TextStyle(
      fontSize: 16,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: medium,
    );
  }

  static TextStyle textStyle14med(Color fontColor) {
    return TextStyle(
      fontSize: 14,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: medium,
    );
  }

  static TextStyle textStyle12med(Color fontColor) {
    return TextStyle(
      fontSize: 12,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: medium,
    );
  }

  static TextStyle textStyle12medItalic(Color fontColor) {
    return TextStyle(
      fontSize: 12,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: medium,
      fontStyle: FontStyle.italic,
    );
  }

  static TextStyle textStyle10med(Color fontColor) {
    return TextStyle(
      fontSize: 10,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: medium,
    );
  }

  static TextStyle textStyle8med(Color fontColor) {
    return TextStyle(
      fontSize: 8,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: medium,
    );
  }

  ///************* semiBold *******************************************************

  static TextStyle textStyle24sem(Color fontColor) {
    return TextStyle(
      fontSize: 24,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: semiBold,
    );
  }

  static TextStyle textStyle21sem(Color fontColor) {
    return TextStyle(
      fontSize: 21,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: semiBold,
    );
  }

  static TextStyle textStyle22sem(Color fontColor) {
    return TextStyle(
      fontSize: 22,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: semiBold,
    );
  }

  static TextStyle textStyle20sem(Color fontColor) {
    return TextStyle(
      fontSize: 20,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: semiBold,
    );
  }

  static TextStyle textStyle18sem(Color fontColor) {
    return TextStyle(
      fontSize: 18,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: semiBold,
    );
  }

  static TextStyle textStyle15sem(Color fontColor) {
    return TextStyle(
      fontSize: 15,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: semiBold,
    );
  }

  static TextStyle textStyle16sem(Color fontColor) {
    return TextStyle(
      fontSize: 16,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: semiBold,
    );
  }

  static TextStyle textStyle14sem(Color fontColor) {
    return TextStyle(
      fontSize: 14,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: semiBold,
    );
  }

  static TextStyle textStyle12sem(Color fontColor) {
    return TextStyle(
      fontSize: 12,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: semiBold,
    );
  }

  static TextStyle textStyle10sem(Color fontColor) {
    return TextStyle(
      fontSize: 10,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: semiBold,
    );
  }

  static TextStyle textStyle8sem(Color fontColor) {
    return TextStyle(
      fontSize: 8,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: semiBold,
    );
  }

  ///************* bold *******************************************************

  static TextStyle textStyle28bold(Color fontColor) {
    return TextStyle(
      fontSize: 28,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: bold,
    );
  }

  static TextStyle textStyle24bold(Color fontColor) {
    return TextStyle(
      fontSize: 24,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: bold,
    );
  }

  static TextStyle textStyle22bold(Color fontColor) {
    return TextStyle(
      fontSize: 22,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: bold,
    );
  }

  static TextStyle textStyle20bold(Color fontColor) {
    return TextStyle(
      fontSize: 20,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: bold,
    );
  }

  static TextStyle textStyle18bold(Color fontColor) {
    return TextStyle(
      fontSize: 18,
      // fontSize: MediaQuery.of(NavigationService.navigatorKey.currentContext!).size.width * 0.05,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: bold,
    );
  }

  static TextStyle textStyle15bold(Color fontColor) {
    return TextStyle(
      fontSize: 15,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: bold,
    );
  }

  static TextStyle textStyle16bold(Color fontColor) {
    return TextStyle(
      fontSize: 16,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: bold,
    );
  }

  static TextStyle textStyle14bold(Color fontColor) {
    return TextStyle(
      fontSize: 14,
      // fontSize: MediaQuery.of(NavigationService.navigatorKey.currentContext!).size.width * 0.044,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: bold,
    );
  }

  static TextStyle textStyle12bold(Color fontColor) {
    return TextStyle(
      fontSize: 12,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: bold,
    );
  }

  static TextStyle textStyle10bold(Color fontColor) {
    return TextStyle(
      fontSize: 10,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: bold,
    );
  }

  static TextStyle textStyle11bold(Color fontColor) {
    return TextStyle(
      fontSize: 11,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: bold,
    );
  }

  static TextStyle textStyle8bold(Color fontColor) {
    return TextStyle(
      fontSize: 8,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: bold,
    );
  }

  ///**************** extra bold ***********************************************

  static TextStyle textStyle24extra(Color fontColor) {
    return TextStyle(
      fontSize: 24,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: extraBold,
    );
  }

  static TextStyle textStyle22extra(Color fontColor) {
    return TextStyle(
      fontSize: 22,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: extraBold,
    );
  }

  static TextStyle textStyle20extra(Color fontColor) {
    return TextStyle(
      fontSize: 20,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: extraBold,
    );
  }

  static TextStyle textStyle18extra(Color fontColor) {
    return TextStyle(
      fontSize: 18,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: extraBold,
    );
  }

  static TextStyle textStyle16extra(Color fontColor) {
    return TextStyle(
      fontSize: 16,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: extraBold,
    );
  }

  static TextStyle textStyle14extra(Color fontColor) {
    return TextStyle(
      fontSize: 14,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: extraBold,
    );
  }

  static TextStyle textStyle12extra(Color fontColor) {
    return TextStyle(
      fontSize: 12,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: extraBold,
    );
  }

  static TextStyle textStyle10extra(Color fontColor) {
    return TextStyle(
      fontSize: 10,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: extraBold,
    );
  }

  static TextStyle textStyle8extra(Color fontColor) {
    return TextStyle(
      fontSize: 8,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: extraBold,
    );
  }

  static TextStyle textStyle35bold(Color fontColor) {
    return TextStyle(
      fontSize: 35,
      color: fontColor,
      fontFamily: fontFamily,
      fontWeight: bold,
    );
  }
}

class BasicSans {
  static const fontFamily = "Basic Sans";

  static FontWeight light = FontWeight.w100;
  static FontWeight regular = FontWeight.w200;
  static FontWeight medium = FontWeight.w300;
  static FontWeight semibold = FontWeight.w400;
  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w900;
}



class FontSize {

  // static double f1 = ;
//
}

// TextStyle textStyle18med(Color fontColor){
//   return TextStyle(
//     fontSize: 18,
//     color: fontColor,
//     fontFamily: fontFamily,
//     fontWeight: medium,
//
//   );
// }
//
// TextStyle textStyle19sem(Color fontColor){
//   return TextStyle(
//     fontSize: 19,
//     color: fontColor,
//     fontFamily: fontFamily,
//     fontWeight: semibold,
//
//   );
// }
// TextStyle textStyle18bold(Color fontColor){
//   return TextStyle(
//     fontSize: 19,
//     color: fontColor,
//     fontFamily: fontFamily,
//     fontWeight: bold,
//
//   );
// }
// TextStyle textStyle16bold(Color fontColor){
//   return TextStyle(
//     fontSize: 19,
//     color: fontColor,
//     fontFamily: fontFamily,
//     fontWeight: bold,
//
//   );
// }
// TextStyle textStyle18reg(Color fontColor){
//   return TextStyle(
//       fontSize: 18,
//       color: fontColor,
//       fontFamily: fontFamily,
//       fontWeight: regular
//   );
// }
//
// TextStyle textStyle17sem (Color color){
//   return TextStyle(
//     fontSize: 17,
//     color: color,
//     fontFamily: fontFamily,
//     fontWeight: semibold,
//   );
// }
//
// TextStyle textStyle17bold (Color color){
//   return TextStyle(
//     fontSize: 17,
//     color: color,
//     fontFamily: fontFamily,
//     fontWeight: bold,
//   );
// }
//
// TextStyle textButtonTextStyle(Color fontColor,double fontSize,FontWeight fontWeight){
//   return TextStyle(
//       fontSize: fontSize,
//       color: fontColor,
//       fontFamily: fontFamily,
//       fontWeight: fontWeight
//   );
// }
//
//
// TextStyle textStyle14med(Color color){
//   return TextStyle(
//       fontFamily: fontFamily,
//       fontWeight: medium,
//       color: color,
//       fontSize: 15
//   );
// }
// TextStyle textStyle14sem(Color color){
//
//   return TextStyle(
//     fontFamily: fontFamily,
//     fontWeight: semibold,
//     color: color ,
//     fontSize:  15,
//   );
// }
// TextStyle textStyle14reg(Color color){
//   return TextStyle(
//       fontFamily: fontFamily,
//       fontWeight: regular,
//       color: color ,
//       fontSize: 14
//   );
// }
//
//
// TextStyle textStyle12bol(Color color){
//   return TextStyle(
//       decoration: TextDecoration.underline,
//       decorationThickness: 2,
//       decorationStyle: TextDecorationStyle.solid,
//       fontSize: 12,
//       fontFamily: fontFamily,
//       fontWeight: bold,
//       color: color
//   );
// }
//
// TextStyle textStyle10reg(Color color){
//   return TextStyle(
//       fontSize: 10,
//       fontFamily: fontFamily,
//       fontWeight: regular,
//       color: color
//     //
//   );
// }
// TextStyle textStyle10sem(Color color){
//   return TextStyle(
//
//
//       fontSize: 11,
//       fontFamily: fontFamily,
//       fontWeight: semibold,
//       color: color
//     //
//   );
// }
// TextStyle textStyle10med(Color color){
//   return TextStyle(
//       fontSize: 11,
//       fontFamily: fontFamily,
//       fontWeight: medium,
//       color: color
//     //
//   );
// }
//
//
// TextStyle textStyle12reg(Color color){
//   return TextStyle(
//       fontSize: 13,
//       fontFamily: fontFamily,
//       fontWeight: regular,
//       color: color
//     //
//   );
// }
//
//
// TextStyle textStyle22med (Color color){
//   return TextStyle(
//       fontSize: 22,
//       color: color,
//       fontFamily: fontFamily,
//       fontWeight: medium
//   );
// }
//
// TextStyle textStyle22sem (Color color){
//   return TextStyle(
//     letterSpacing: 1,
//     fontSize: 23,
//     color: color,
//     fontFamily: fontFamily,
//     fontWeight: semibold,
//   );
// }
// TextStyle textStyle22bold (Color color){
//   return TextStyle(
//     fontSize: 22,
//     color: color,
//     fontFamily: fontFamily,
//     fontWeight: bold,
//   );
// }
//
// TextStyle textStyle16med (Color color){
//   return TextStyle(
//     fontSize: 16,
//     color: color,
//     fontFamily: fontFamily,
//     fontWeight: medium,
//   );
// }
//
// TextStyle textStyle16reg (Color color){
//   return TextStyle(
//     letterSpacing: .5,
//     height: 1.6,
//     fontSize: 17,
//     color: color,
//     fontFamily: fontFamily,
//     fontWeight: regular,
//   );
// }
//
//
// TextStyle textStyle15reg (Color color){
//   return TextStyle(
//     fontSize: 15,
//     color: color,
//     fontFamily: fontFamily,
//     fontWeight: regular,
//   );
// }
// TextStyle textStyle15med (Color color){
//   return TextStyle(
//     fontSize: 15,
//     color: color,
//     fontFamily: fontFamily,
//     fontWeight: medium,
//   );
// }
// TextStyle textStyle15sem (Color color){
//   return TextStyle(
//     fontSize: 15,
//     color: color,
//     fontFamily: fontFamily,
//     fontWeight: semibold,
//   );
// }
//
// TextStyle textStyle16sem (Color color){
//   return TextStyle(
//     fontSize: 16,
//     color: color,
//     fontFamily: fontFamily,
//     fontWeight: semibold,
//   );
// }
// TextStyle textStyle24bold (Color color){
//   return TextStyle(
//     fontSize: 25,
//     color: color,
//     fontFamily: fontFamily,
//     fontWeight: bold,
//   );
// }
//
// TextStyle textStyle28bold (Color color){
//   return TextStyle(
//     fontSize: 28,
//     color: color,
//     fontFamily: fontFamily,
//     fontWeight: bold,
//   );
// }
//
// TextStyle textStyle24sem (Color color){
//   return TextStyle(
//     fontSize: 24,
//     color: color,
//     fontFamily: fontFamily,
//     fontWeight: semibold,
//   );
// }
//
// TextStyle textStyle12med (Color color){
//   return TextStyle(
//       fontSize: 13,
//       fontFamily: fontFamily,
//       fontWeight: medium,
//       color: color
//   );
// }
//
// TextStyle textStyle12sem (Color color){
//   return TextStyle(
//       fontSize: 12,
//       fontFamily: fontFamily,
//       fontWeight: semibold,
//       color: color
//   );
// }
//
// TextStyle textStyle8sem (Color color){
//   return TextStyle(
//     fontSize: 8,
//     color: color,
//     fontFamily: fontFamily,
//     fontWeight: semibold,
//   );
// }

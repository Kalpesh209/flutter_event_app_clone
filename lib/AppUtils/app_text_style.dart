import 'package:flutter/material.dart';
import 'package:flutter_event_app_clone/AppUtils/app_font_size.dart';
import 'package:flutter_event_app_clone/AppUtils/app_font_weight.dart';

/*
Title: AppTextStyle Used through App
Purpose:AppTextStyle Used through App
Created On:03/06/2024
Edited On:03/06/2024
Author: Kalpesh Khandla
*/

class AppTextStyle {
  // 24 Font Size

  static TextStyle metropolis24Regular({Color? color}) => TextStyle(
        fontFamily: 'Metropolis',
        fontSize: AppFontSize.fontSize24,
        fontWeight: AppFontWeight.fontWeight400,
        color: color,
      );

  static TextStyle metropolis24SemiBold({Color? color}) => TextStyle(
        fontFamily: 'Metropolis',
        fontSize: AppFontSize.fontSize24,
        fontWeight: AppFontWeight.fontWeight600,
        color: color,
      );

  // 12 Font Size
  static TextStyle metropolis12Regular({Color? color}) => TextStyle(
        fontFamily: 'Metropolis',
        fontSize: AppFontSize.fontSize12,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle metropolis12SemiBold({Color? color}) => TextStyle(
        fontFamily: 'Metropolis',
        fontSize: AppFontSize.fontSize12,
        fontWeight: AppFontWeight.fontWeight600,
        color: color,
      );

  static TextStyle poppins12Bold({Color? color}) => TextStyle(
        fontFamily: 'Metropolis',
        fontSize: 12,
        fontWeight: AppFontWeight.fontWeightBold,
        color: color,
      );

  static TextStyle poppins12ExtraBold({Color? color}) => TextStyle(
        fontFamily: 'Metropolis',
        fontSize: 12,
        fontWeight: AppFontWeight.fontWeight800,
        color: color,
      );

  // 18 Family

  static TextStyle metropolis18Regular({Color? color}) => TextStyle(
        fontFamily: 'Metropolis',
        fontSize: AppFontSize.fontSize18,
        fontWeight: AppFontWeight.fontWeight400,
        color: color,
      );

  static TextStyle metropolis18Light({Color? color}) => TextStyle(
        fontFamily: 'Metropolis',
        fontSize: AppFontSize.fontSize18,
        color: color,
        fontWeight: AppFontWeight.fontWeight400,
      );

  static TextStyle metropolis18Medium({Color? color}) => TextStyle(
        fontFamily: 'Metropolis',
        fontSize: AppFontSize.fontSize18,
        color: color,
        fontWeight: AppFontWeight.fontWeight500,
      );

  static TextStyle metropolisSemiBold({Color? color}) => TextStyle(
        fontFamily: 'Metropolis',
        fontSize: AppFontSize.fontSize18,
        fontWeight: AppFontWeight.fontWeight600,
        color: color,
      );
}

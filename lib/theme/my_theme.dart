import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_colors.dart';

ThemeData myTheme() {
  return ThemeData(
      fontFamily: 'lato',
      textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 20, color: AppColors.bgGrandentTop),
          titleSmall: TextStyle(fontSize: 16, color: AppColors.bgGrandentTop , fontWeight: FontWeight.bold),
          labelLarge:
              TextStyle(fontSize: 12, color: AppColors.bgGrandentTop.withOpacity(0.2), 
              fontWeight: FontWeight.bold) ,
          labelMedium:
              TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: const Color(0xff181743).withOpacity(0.8)) ,
          bodySmall:
              TextStyle(
                fontSize: 12,
                color: const Color(0xff95989A)) ,
          labelSmall:
              TextStyle(fontSize: 10, color: const Color(0xff181743).withOpacity(0.6))
              
              
              ) 
              );
}

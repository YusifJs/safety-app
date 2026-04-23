import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTextStyle {
  // Blue
  static final blueBold32 = GoogleFonts.almarai(
    fontSize: 32.sp,
    color: AppColors.blue,
    fontWeight: FontWeight.w700,
  );
  static final blueBold16 = GoogleFonts.almarai(
    fontSize: 16.sp,
    color: AppColors.blue,
    fontWeight: FontWeight.w700,
  );
  static final blueBold12 = GoogleFonts.almarai(
    fontSize: 12.sp,
    color: AppColors.blue,
    fontWeight: FontWeight.w700,
  );
  static final blueRegular12 = GoogleFonts.almarai(
    fontSize: 12.sp,
    color: AppColors.blue,
    fontWeight: FontWeight.w400,
  );

  // Black
  static final blackBold20 = GoogleFonts.almarai(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );
  static final blackBold16 = GoogleFonts.almarai(
    fontSize: 16.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );
  static final blackRegular16 = GoogleFonts.almarai(
    fontSize: 16.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );
  static final blackRegular12 = GoogleFonts.almarai(
    fontSize: 12.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  // White
  static final whiteBold20 = GoogleFonts.almarai(
    fontSize: 20.sp,
    color: AppColors.white,
    fontWeight: FontWeight.w700,
  );
  static final whiteBold16 = GoogleFonts.almarai(
    fontSize: 16.sp,
    color: AppColors.white,
    fontWeight: FontWeight.w700,
  );
  static final whiteRegular12 = GoogleFonts.almarai(
    fontSize: 12.sp,
    color: AppColors.white,
    fontWeight: FontWeight.w400,
  );

  // Dark Grey
  static final darkGreyRegular14 = GoogleFonts.almarai(
    fontSize: 14.sp,
    color: AppColors.darkGrey,
    fontWeight: FontWeight.w400,
  );
  static final darkGreyRegular12 = GoogleFonts.almarai(
    fontSize: 12.sp,
    color: AppColors.darkGrey,
    fontWeight: FontWeight.w400,
  );
}

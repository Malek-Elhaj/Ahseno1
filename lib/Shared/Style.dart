

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppColors {


  static final Color CustomGreen= HexColor("#45C4B0");

  static final Color CustomBlue=HexColor("#13678A");

  static final Color CustomWhite=HexColor("#F6F6F6");

  static final Color CustomGrey=HexColor("#707070");

  static final Color CustomLightBlue=HexColor("#BCE0FD");

  static final Color CustomRed = HexColor("#ff5c33");

  static final  LinearGradient CustomLinearGradient=  LinearGradient(
      tileMode: TileMode.clamp,
      /* begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,*/
      colors: [
        AppColors.CustomBlue.withOpacity(0.0),
        AppColors.CustomGreen.withOpacity(0.9),
      ],
      stops: const [
        0.0,
        0.9
      ]);
}



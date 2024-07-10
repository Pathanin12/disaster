import 'dart:ui';

import 'package:disaster/stye/colors.dart';
import 'package:flutter/cupertino.dart';

TextStyle textStyle(BuildContext context,{double? fontSize,Color? color,FontWeight? fontWeight,String? fontFamily}){
  return TextStyle(
    fontSize: fontSize??14,
    color: color??colorBlack,
    fontWeight: fontWeight,
    fontFamily: "THSarabun"
  );
}
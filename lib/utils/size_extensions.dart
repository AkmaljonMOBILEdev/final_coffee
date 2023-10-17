import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants.dart';

extension Space on num {
  SizedBox get ph => SizedBox(height: toDouble().h);
  SizedBox get pw => SizedBox(width: toDouble().w);
}

double editH(double itemHeight){
  return  height * itemHeight / figmaHeight;
}

double editW(double itemWidth){
  return  width * itemWidth / figmaWidth;
}

final itemWidth = width / 2;
final itemHeight = itemWidth + 50;

final double childAspectRatio = itemWidth / itemHeight;


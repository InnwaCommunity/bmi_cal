double footTocmConvert(double c){
  // double foot=c;
   double foot=c*30.48;
   return foot;
}
double cmTofootConvert(double c){
  return c*0.0328084;
}

// double cmToInch(double cm){
//   return cm/2.54;
// }

int footToInch(double foot){
  double inch= (foot-foot.floor())*12;
  return inch.toInt();
}

// double inchTocm(double feed,double inch){
//   return (feed * 12)+inch;
// }

double kgToLbs(double kg){
  // double kgval=kg*0.45359237;
  double kgval=kg*2.20462262;
  return kgval;
}

double lbsToKg(double lbs){
  double lbsval=lbs*0.45359237;
  return lbsval;
}
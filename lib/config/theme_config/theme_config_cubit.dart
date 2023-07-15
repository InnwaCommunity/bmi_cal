
import 'package:bmi_cal/config/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(ThemeMode themeMode) : super(themeMode);

  void toggleTheme(){
    if (state==ThemeMode.light) {
      emit(ThemeMode.dark);
      SharedPref.setDarkMode(true);
    } else {
      emit(ThemeMode.light);
      SharedPref.setDarkMode(false);
    }
  }
}

import 'package:bmi_cal/main.dart';
import 'package:bmi_cal/modules/home_screen.dart';
import 'package:bmi_cal/weightcalculation/bloc/weight_calculate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes{
  static const splashPage= '/';
  static const home='home';

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    // final argument=settings.arguments;

    switch (settings.name) {
      case '/':
        return makeRoute(
          const SplashScreen(),settings
        );
      case 'home':
      return makeRoute(
        // const HomeScreen(), 
        BlocProvider(
        create: (context) => WeightCalculateBloc(),
        child: const HomeScreen(),
      ),
        settings);
      default:
    }
    return null;
  }
}



Route? makeRoute(Widget widget, RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) {
      return widget;
    },
    settings: settings,
  );
}
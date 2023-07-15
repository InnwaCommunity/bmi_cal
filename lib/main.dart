import 'dart:async';

import 'package:bmi_cal/config/app_theme.dart';
import 'package:bmi_cal/config/content_ext.dart';
import 'package:bmi_cal/config/shared_pref.dart';
import 'package:bmi_cal/config/theme_config/theme_helper.dart';
import 'package:bmi_cal/modules/home_screen.dart';
import 'package:bmi_cal/weightcalculation/bloc/weight_calculate_bloc.dart';
import 'package:bmi_cal/widgets/dismiss_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'config/routes.dart';
import 'config/theme_config/theme_config_cubit.dart';


final GlobalKey<NavigatorState> navigatorKey=GlobalKey(debugLabel: "Main Navigator");
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeMode themeMode=await SharedPref.getDarkMode();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(31, 28, 55, 1),
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color.fromRGBO(31, 28, 55, 1),
    )
  );
  runApp(
    BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(themeMode),
      lazy: false,
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return  GetMaterialApp(
            themeMode: themeMode,
            theme: kLightTheme,
            darkTheme: kDarkTheme,
            debugShowCheckedModeBanner: false,
            title: 'BMI',
            navigatorKey: navigatorKey,
            onGenerateRoute: Routes.routeGenerator,
            // home: SplashScreen(),
          );
        },
      ),
    );
  }
}


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      context.toName(Routes.home);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                      'bmi',
                      style: TextStyle(
                          fontFamily: 'Splashfont',
                          fontSize: 90,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.dashboardRuleDarkBlue),
                    ),
                    Text(
                      'CALCULATOR',
                      style: TextStyle(
                          fontSize: 18,
                          color: AppTheme.dashboardRuleDarkBlue),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                ],
              )
            ),
             Text(
                'VERSION 1.1.4',
                style: TextStyle(
                  color: AppTheme.grayColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
          ],
        ),
      ),
    );
  }
}
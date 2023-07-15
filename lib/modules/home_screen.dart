import 'dart:math';
import 'package:bmi_cal/config/theme_config/theme_config_cubit.dart';
import 'package:bmi_cal/util/function_service.dart';
import 'package:bmi_cal/weightcalculation/bloc/weight_calculate_bloc.dart';
import 'package:bmi_cal/widgets/calculating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../config/theme_config/theme_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color aColor = Colors.grey;
  Color cColor = Colors.black;
  double s1 = 50;
  double s2 = 50;
  double result = 0.0;
  double cmValue = 120;
  double footValue = 3.93700787;
  double weightValue = 40;
  double lbsValue = 88;
  int ageValue = 18;
  int isMale = 0;
  bool light = false;
  bool weightKG = true;
  // Color backcolor=Theme.of(context).colorScheme.primary
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Splashfont',
            fontSize: 26,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          GestureDetector(
            onTap: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            child: BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, thememode) {
                return isDarkTheme(context)
                    ? const Icon(
                        Icons.light_mode,
                        color: Colors.white,
                      )
                    : const Icon(Icons.dark_mode);
              },
            ),
          ),
          const SizedBox(
            width: 30,
          )
          // const Spacer(),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 140,
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                    ),
                    margin: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                    padding: const EdgeInsets.all(3),
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          aColor = Colors.grey;
                          aColor = cColor;
                          s1 = 70;
                          s2 = 50;
                          isMale = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.mars,
                            size: s1,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'MALE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
                      // color: aColor,
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                    ),
                    margin: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                    padding: const EdgeInsets.all(3),
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          aColor = Colors.grey;
                          aColor = cColor;
                          s2 = 70;
                          s1 = 50;
                          isMale = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.venus,
                            size: s2,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'FEMALE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: 170,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'HEIGHT :',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CupertinoSlider(
                                value: cmValue,
                                divisions: 90,
                                min: 30,
                                max: 210,
                                activeColor: Colors.white,
                                thumbColor: CupertinoColors.white,
                                onChanged: (c) {
                                  setState(() {
                                    cmValue = c;
                                    footValue = cmTofootConvert(c);
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                cmValue.toInt().toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Splashfont',
                                  fontSize: 20,
                                ),
                              ),
                              const Text(
                                'CM',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CupertinoSlider(
                                value: footValue,
                                divisions: 90,
                                min: 0.98425197,
                                max: 6.88976378,
                                activeColor: Colors.white,
                                thumbColor: CupertinoColors.white,
                                onChanged: (c) {
                                  setState(() {
                                    footValue = c;
                                    cmValue = footTocmConvert(c);
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        footValue.floor().toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Splashfont',
                                          fontSize: 20,
                                        ),
                                      ),
                                      const Text(
                                        'Feet',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        footToInch(footValue).toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Splashfont',
                                          fontSize: 20,
                                        ),
                                      ),
                                      const Text(
                                        'Inches',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )),
          SizedBox(
            height: 200,
            child: Row(
              children: [
                BlocConsumer<WeightCalculateBloc, WeightCalculateState>(
                  listener: (context, state) {
                    if (state is ChangeWidgetSuccess) {
                      weightKG=state.toggle;
                    }
                  },
                  builder: (context, state) {
                    return Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          margin: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                          padding: const EdgeInsets.all(3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'WEIGHT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      changeWeight(weightKG);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: weightKG == true
                                            ? Colors.greenAccent
                                            : Colors.green,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      margin:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 7, vertical: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            weightValue.toInt().toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Splashfont',
                                              fontSize: 25,
                                            ),
                                          ),
                                          const Text(
                                            'KG',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Splashfont',
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      changeWeight(weightKG);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: weightKG == true
                                            ? Colors.green
                                            : Colors.greenAccent,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      margin:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 7, vertical: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            lbsValue.toInt().toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Splashfont',
                                              fontSize: 25,
                                            ),
                                          ),
                                          const Text(
                                            'LB',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Splashfont',
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  GestureDetector(
                                    onLongPress: () {
                                      setState(() {
                                        if (weightValue > 40) {
                                          weightValue -= 10;
                                        } else {
                                          weightValue = 30;
                                        }
                                      });
                                    },
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        setState(() {
                                          // weightKG==true ?
                                          // if (weightValue > 30) {
                                          //   weightValue--;
                                          // };
                                          // : if(lbsValue>88){
                                          //   lbsValue--;
                                          // }
                                          if (weightKG==true) {
                                            weightValue--;
                                            lbsValue=kgToLbs(weightValue);
                                          } else {
                                            lbsValue--;
                                            weightValue=lbsToKg(lbsValue);
                                          }
                                        });
                                      },
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors.grey,
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onLongPress: () {
                                      setState(() {
                                        if (weightValue < 110) {
                                          weightValue += 10;
                                        } else {
                                          weightValue = 120;
                                        }
                                      });
                                    },
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        setState(() {
                                          // if (weightValue < 120) {
                                          //   weightValue++;
                                          // }
                                          if (weightKG==true) {
                                            weightValue++;
                                            lbsValue=kgToLbs(weightValue); 
                                          } else {
                                            lbsValue++;
                                            weightValue=lbsToKg(lbsValue);
                                          }
                                        });
                                      },
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors.grey,
                                      child: const Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    );
                  },
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      margin: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                      padding: const EdgeInsets.all(3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'AGE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            ageValue.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Splashfont',
                              fontSize: 38,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onLongPress: () {
                                  setState(() {
                                    if (ageValue > 20) {
                                      ageValue -= 10;
                                    } else {
                                      ageValue = 10;
                                    }
                                  });
                                },
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (ageValue > 10) {
                                        ageValue--;
                                      }
                                    });
                                  },
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.grey,
                                  child: const Icon(Icons.remove),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onLongPress: () {
                                  setState(() {
                                    if (ageValue < 38) {
                                      ageValue += 10;
                                    } else {
                                      ageValue = 48;
                                    }
                                  });
                                },
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (ageValue < 48) {
                                        ageValue++;
                                      }
                                    });
                                  },
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.grey,
                                  child: const Icon(Icons.add),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              if (isMale == 0) {
                showSnackBar(context, "You haven't chosen your gender yet !");
              } else {
                result = weightValue / pow(cmValue / 100, 2);
                Get.to(
                  Calculating(
                    result,
                    isMale,
                    cmValue,
                    weightValue.toInt(),
                    ageValue,
                  ),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(19.0)),
                color: Theme.of(context).colorScheme.onBackground,
                // gradient: LinearGradient(
                //   begin: Alignment.topRight,
                //   end: Alignment.bottomLeft,
                //   stops: [0.1, 0.2, 0.4, 0.6, 0.8, 1.0],
                //   colors: [
                //     Color.fromRGBO(255, 113, 200, 1),
                //     Color.fromARGB(255, 90, 24, 196),
                //     Color.fromRGBO(252, 11, 123, 1),
                //     Color.fromARGB(255, 245, 85, 10),
                //     Color.fromARGB(255, 228, 195, 9),
                //     Color.fromARGB(255, 240, 225, 12),
                //   ],
                //   // colors: [Theme.of(context).colorScheme.onBackground],
                // ),
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'CALCULATE',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changeWeight(bool toggle){
    BlocProvider.of<WeightCalculateBloc>(context)
    .add(ChangeWidgetEvent(toggle: toggle));
  }
  void showSnackBar(BuildContext context, String textvalue) {
    final text = textvalue;
    final snackBar = SnackBar(
      backgroundColor: Colors.black87,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      content: Row(
        children: [
          const Icon(
            Icons.error,
            color: Colors.red,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(text),
          )
        ],
      ),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

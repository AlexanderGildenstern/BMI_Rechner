import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/ui_components/RoundButtonsWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import 'result_Window.dart';

class InputWindow extends StatefulWidget {
  @override
  _InputWindowState createState() => _InputWindowState();
}

class _InputWindowState extends State<InputWindow> {
  String gender = 'male';
  int age = 25;
  int height = 180;
  int weight = 65;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI-Rechner',
          style: kAppBarTextStyle,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Icons Buttons
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RoundButtonWidget(
                    color: gender == 'male'
                        ? kDarkGrayWidgetBackground
                        : kLightGrayWidgetBackground,
                    content: const Icon(
                      FontAwesomeIcons.male,
                      size: 70,
                      color: Color(0xFFC2EBFF),
                    ),
                    isTapped: () {
                      setState(() {
                        gender = kMale;
                      });
                    },
                  ),
                  RoundButtonWidget(
                    color: gender == 'female'
                        ? kDarkGrayWidgetBackground
                        : kLightGrayWidgetBackground,
                    content: const Icon(FontAwesomeIcons.female,
                        size: 70, color: Color(0xFFFFC0D1)),
                    isTapped: () {
                      setState(() {
                        gender = kFemale;
                      });
                    },
                  ),
                ],
              ),
            ),
            // Alter, Eingabe Modul
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Alter',
                            style: kUnitTextStyle,
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Text(
                          age.toString(),
                          style: kValueTextStyle,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        //Text('Jahre'),
                      ],
                    ),
                    Slider(
                      value: age.toDouble(),
                      min: 0,
                      max: 140,
                      onChanged: (double newValue) {
                        setState(() {
                          age = newValue.round();
                        });
                      },
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: kLightGrayWidgetBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            // Größe, Eingabe Modul
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Größe',
                            style: kUnitTextStyle,
                          ),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Text(
                          height.toString(),
                          style: kValueTextStyle,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('cm'),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 0,
                      max: 250,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: kLightGrayWidgetBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            // Gewicht, Eingabe Modul
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Gewicht',
                            style: kUnitTextStyle,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Text(
                          weight.toString(),
                          style: kValueTextStyle,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('kg'),
                      ],
                    ),
                    Slider(
                      value: weight.toDouble(),
                      min: 0,
                      max: 200,
                      onChanged: (double newValue) {
                        setState(() {
                          weight = newValue.round();
                        });
                      },
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: kLightGrayWidgetBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            // play buttons
            RoundButtonWidget(
              color: const Color(0xFF3E3E4C),
              content: const Icon(
                FontAwesomeIcons.play,
                size: 70,
                color: Color(0xFF55B945),
              ),
              isTapped: () {
                BMICalculator result = BMICalculator(
                  gender: gender.toString(),
                  height: height,
                  weight: weight,
                  age: age,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultWindow(
                            bmiResult: result.bmiCalculation(),
                            bmiColor: result.getBMIColor(),
                            bmiText: result.getBMIText(),
                          )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

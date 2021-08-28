import 'package:bmi_calculator/code/app_const.dart';
import 'package:bmi_calculator/code/bmi_calculation.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  int height = 170;
  int weight = 50;
  int age = 18;
  Gender? selectedGender;

  void setActiveCard(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPressed: () => setActiveCard(Gender.male),
                      color: selectedGender == Gender.male
                          ? cardActiveColor
                          : cardInactiveColor,
                      child: IconContent(
                        icon: Icons.male,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setActiveCard(Gender.female);
                      },
                      child: ReusableCard(
                        onPressed: () => setActiveCard(Gender.female),
                        color: selectedGender == Gender.female
                            ? cardActiveColor
                            : cardInactiveColor,
                        child: IconContent(
                          icon: Icons.female,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: labelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '$height',
                          style: numberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT', style: labelTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '$weight',
                                style: numberTextStyle,
                              ),
                              Text(
                                'kg',
                                style: labelTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: Icons.remove,
                                  onPressed: () {
                                    if (weight > 1) {
                                      setState(() => weight--);
                                    }
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    if (weight < 200) {
                                      setState(() => weight++);
                                    }
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE', style: labelTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '$age',
                                style: numberTextStyle,
                              ),
                              Text(
                                'old',
                                style: labelTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: Icons.remove,
                                  onPressed: () {
                                    if (age > 1) {
                                      setState(() => age--);
                                    }
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    if (age < 120) {
                                      setState(() => age++);
                                    }
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
                label: 'CALCULATE YOUR BMI',
                onPressed: () {
                  BmiCalculation bmiCal =
                      BmiCalculation(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultPage(
                          bmiResult: bmiCal.calculateBMI(),
                          resultText: bmiCal.getResult(),
                          interpretation: bmiCal.getInterpretation(),
                        );
                      },
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

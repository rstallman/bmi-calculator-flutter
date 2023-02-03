import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../components/round_icon_button.dart';
import '../screens/results_page.dart';
import '../components/bottom_button.dart';
import 'calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    var maleCard = Expanded(
      child: ReusableCard(
        color: selectedGender == Gender.male
            ? kActiveCardColor
            : kInactiveCardColor,
        cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
        onTap: () {
          setState(() {
            selectedGender = Gender.male;
          });
        },
      ),
    );

    var femaleCard = Expanded(
      child: ReusableCard(
        color: selectedGender == Gender.female
            ? kActiveCardColor
            : kInactiveCardColor,
        cardChild: IconContent(
          icon: FontAwesomeIcons.venus,
          label: 'FEMALE',
        ),
        onTap: () {
          setState(() {
            selectedGender = Gender.female;
          });
        },
      ),
    );

    var weightCard = Expanded(
      child: ReusableCard(
        color: kActiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WEIGHT',
              style: kLabelTextStyle,
            ),
            Text(
              weight.toString(),
              style: kNumberTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                  icon: FontAwesomeIcons.plus,
                  onPressed: () {
                    setState(() {
                      weight++;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: () {
                    setState(() {
                      if (weight > 1) weight--;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );

    var ageCard = Expanded(
      child: ReusableCard(
        color: kActiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'AGE',
              style: kLabelTextStyle,
            ),
            Text(
              age.toString(),
              style: kNumberTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                  icon: FontAwesomeIcons.plus,
                  onPressed: () {
                    setState(() {
                      age++;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: () {
                    setState(() {
                      if (age > 1) age--;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  maleCard,
                  femaleCard,
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: [
                weightCard,
                ageCard,
              ],
            )),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                var calc = CalculatorBrain(weight: weight, height: height);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      ),
                    ));
              },
            ),
          ],
        ));
  }
}

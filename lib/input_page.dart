import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/icon_gender.dart';
import 'package:life_expectancy/my_container.dart';
import 'package:life_expectancy/result_page.dart';
import 'package:life_expectancy/user_data.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? selectedGender;
  double smokedCigarette = 15.0;
  double sportDay = 3.0;
  int height = 170;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Life Expectancy',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButon('Height'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButon('Weight'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'How many days a week do you work out?',
                    style: kTextStyle,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    sportDay.round().toString(),
                    style: TextNumStyle,
                  ),
                  Slider(
                    inactiveColor: Colors.grey,
                    min: 0,
                    max: 7,
                    value: sportDay,
                    divisions: 7,
                    activeColor: Colors.black87,
                    onChanged: (double value1) {
                      setState(
                        () {
                          sportDay = value1;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'How many cigarettes do you smoke a day?',
                    style: kTextStyle,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    smokedCigarette.round().toString(),
                    style: TextNumStyle,
                  ),
                  Slider(
                    inactiveColor: Colors.grey,
                    min: 0,
                    max: 30,
                    value: smokedCigarette,
                    activeColor: Colors.black87,
                    onChanged: (double value) {
                      setState(
                        () {
                          smokedCigarette = value;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(
                        () {
                          selectedGender = 'Female';
                        },
                      );
                    },
                    color:
                        selectedGender == 'Female' ? Colors.grey : Colors.white,
                    child: const IconGender(
                        gender: 'Female', icon: FontAwesomeIcons.venus),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(
                        () {
                          selectedGender = 'Male';
                        },
                      );
                    },
                    color:
                        selectedGender == 'Male' ? Colors.grey : Colors.white,
                    child: const IconGender(
                        gender: 'Male', icon: FontAwesomeIcons.mars),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white, // Buton metin rengi
                textStyle: kTextStyle,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      UserData(
                          height: height,
                          weight: weight,
                          selectedGender: selectedGender,
                          smokedCigarette: smokedCigarette,
                          sportDay: sportDay),
                    ),
                  ),
                );
              },
              child: Text('Hesapla'),
            ),
          ),
        ],
      ),
    );
  }

  Row buildRowOutlineButon(String label) {
    return Row(
      children: [
        const SizedBox(width: 15),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            label,
            style: kTextStyle,
          ),
        ),
        const SizedBox(width: 15),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            label == 'Height' ? height.toString() : weight.toString(),
            style: TextNumStyle,
          ),
        ),
        const SizedBox(width: 15),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                setState(
                  () {
                    label == 'Height' ? height++ : weight++;
                  },
                );
              },
              child: Icon(
                FontAwesomeIcons.plus,
                size: 20,
                color: Colors.black87,
              ),
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  const BorderSide(
                    color: Colors.black87,
                    style: BorderStyle.solid,
                  ),
                ),
                overlayColor: const MaterialStatePropertyAll(
                  Colors.black38,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                setState(
                  () {
                    label == 'Height' ? height-- : weight--;
                  },
                );
              },
              child:
                  Icon(FontAwesomeIcons.minus, size: 20, color: Colors.black87),
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(color: Colors.black87),
                ),
                overlayColor: const MaterialStatePropertyAll(Colors.black38),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

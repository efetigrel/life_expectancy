import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/icon_gender.dart';
import 'package:life_expectancy/my_container.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? selectedGender;
  double smokedCigarette = 15.0;
  double sportDay = 3.0;

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(),
                ),
                Expanded(
                  child: MyContainer(),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'How many days a week do you work out?',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    sportDay.round().toString(),
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    min: 0,
                    max: 7,
                    value: sportDay,
                    divisions: 7,
                    activeColor: Colors.black87,
                    onChanged: (double value1) {
                      setState(() {
                        sportDay = value1;
                      });
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
                  const Text(
                    'How many cigarettes do you smoke a day?',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    smokedCigarette.round().toString(),
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Slider(
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
                      setState(() {
                        selectedGender = 'Female';
                      });
                    },
                    color: selectedGender == 'Female'
                        ? Colors.pinkAccent
                        : Colors.white,
                    child: const IconGender(
                        gender: 'Female', icon: FontAwesomeIcons.venus),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = 'Male';
                      });
                    },
                    color: selectedGender == 'Male'
                        ? Colors.blueAccent
                        : Colors.white,
                    child: const IconGender(
                        gender: 'Male', icon: FontAwesomeIcons.mars),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

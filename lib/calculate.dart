import 'package:life_expectancy/user_data.dart';

class Calculate {
  UserData _userData;
  Calculate(this._userData);

  double calculation() {
    double conclusion;

    conclusion =
        90 + (_userData.sportDay ?? 0) - (_userData.smokedCigarette ?? 0);
    conclusion =
        conclusion + ((_userData.height ?? 0) / (_userData.weight ?? 1));

    // if (_userData.selectedGender == 'Kadın') {
    //   return conclusion + 3;
    // } else {
    //   return conclusion;
    // }

    return _userData.selectedGender == 'Female' ? conclusion + 3 : conclusion;
  }
}

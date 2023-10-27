import 'package:flutter/material.dart';

class IconGender extends StatelessWidget {
  final String? gender;
  final IconData? icon;
  const IconGender({super.key, this.gender, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      // 'const' anahtar kelimesi kaldırıldı
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black87,
        ),
        const SizedBox(height: 10),
        Text(
          gender ?? '',
          style: const TextStyle(
              color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

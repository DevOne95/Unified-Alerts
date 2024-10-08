import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("2023  ZAMBOANGA CITY MEDICAL CENTER . All Rights reserved",
              style: TextStyle(fontSize: 10, color: Colors.black54))
        ],
      ),
    );
  }
}

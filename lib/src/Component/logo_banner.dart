import 'package:flutter/material.dart';

class LogoBanner extends StatelessWidget {
  const LogoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 60,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "UNIFIED ALERTS",
                    style: TextStyle(
                        fontFamily: "Popppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                        letterSpacing: 2),
                  ),
                  const Divider(
                    height: 3,
                    color: Colors.black26,
                    thickness: 0.5,
                  ),
                  const Text(
                    "Zamboanga City Medical Center",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

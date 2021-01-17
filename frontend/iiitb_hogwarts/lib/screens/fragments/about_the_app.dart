import 'package:flutter/material.dart';

class AboutTheApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration:
          BoxDecoration(border: Border.all(color: Color(0xFFDF267C).withOpacity(0.4), width: 3)),
          child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("images/ic_foreground.png", height: 80, width: 80),
          SizedBox(width: 4),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("IIITB Howarts",
                    textAlign: TextAlign.center, textScaleFactor: 1.7),
                Text(
                  "An initiative towards open-source development",
                  textAlign: TextAlign.center,
                  textScaleFactor: 1,
                ),
                Text(
                  "Version 1.0.0 | 2021 © OpenSource IIITB",
                  textAlign: TextAlign.center,
                  textScaleFactor: 1,
                  style: TextStyle(color: Colors.white38),
                )
              ],
            ),
          )
        ],
          ),
        ),
        SizedBox(height: 70)
      ],
    );
  }
}

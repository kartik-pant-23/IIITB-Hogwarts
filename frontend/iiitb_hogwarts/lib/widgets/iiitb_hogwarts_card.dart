import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {

  final Widget child;
  final String title;

  CustomCard({this.child, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: /*Color(0xFFDF267C).withOpacity(0.30)*/Color(0xFF480945),
          boxShadow: [BoxShadow(color: Color(0x55000000), blurRadius: 8, offset: Offset(4,4))]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Divider(color: Colors.white, thickness: 1.5)),
              SizedBox(width: 2),
              Text(title, textScaleFactor: 1.7,),
              SizedBox(width: 2),
              Expanded(child: Divider(color: Colors.white, thickness: 1.5)),
            ],
          ),
          SizedBox(height: 8),
          child
        ],
      ),
    );
  }
}

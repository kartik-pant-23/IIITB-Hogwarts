import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/widgets/contributor_badge.dart';

class AboutTheMakers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ContributorBadge(userName: "kartik-pant-23"),
          ContributorBadge(userName: "b2pacific"),
          ContributorBadge(userName: "99SharmaTushar"),
          ContributorBadge(userName: "team404-dev"),
          ContributorBadge(userName: "amaljoe"),
        ],
      )
    );
  }
}

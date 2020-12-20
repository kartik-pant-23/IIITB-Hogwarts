import 'package:flutter/material.dart';

class SocialMediaBadge extends StatelessWidget {

  final String handle;
  SocialMediaBadge({@required this.handle});

  final Map<String, String> availableHandles = {
    "Facebook": "images/facebook_badge.png",
    "Instagram": "images/instagram_badge.png",
    "LinkedIn": "images/linkedIn_badge.png",
    "Github": "images/github_badge.png",
    "Twitter": "images/twitter_badge.png",
    "Youtube": "images/youtube_badge.png",
    "Personal Website": "images/personal_badge.png",
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Color(0x55000000),
          blurRadius: 6
        )],
        borderRadius: BorderRadius.circular(2)
      ),
      child: Image.asset(availableHandles[handle]),
    );
  }
}

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/services/admob.dart';

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AdmobBanner(
          adUnitId: AdmobAds().getBannerId(),
          adSize: AdmobBannerSize.LARGE_BANNER,
        ),
      ),
    );
  }

}

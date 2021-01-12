import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/services/admob.dart';
import 'package:iiitb_hogwarts/utils/important_strings.dart';
import 'package:iiitb_hogwarts/widgets/iiitb_hogwarts_card.dart';
import 'package:iiitb_hogwarts/widgets/social_media_badge.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  AdmobReward rewardedAds = AdmobReward(adUnitId: AdmobAds().getRewardAdId());
  final scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    rewardedAds = AdmobReward(
      //adUnitId: 'ca-app-pub-3940256099942544/5224354917', This is test-ad-Id
      adUnitId: AdmobAds().getRewardAdId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) rewardedAds.load();
        handleEvent(event, args, 'Reward');
      },
    );

    rewardedAds.load();
    super.initState();
  }

  void handleEvent(
      AdmobAdEvent event, Map<String, dynamic> args, String adType) {
    switch (event) {
      case AdmobAdEvent.closed:
        showSnackBar('Now ad cannot be viewed for couple of hours!');
        break;
      case AdmobAdEvent.rewarded:
        showDialog(
          context: scaffoldState.currentContext,
          builder: (BuildContext context) {
            return WillPopScope(
              child: AlertDialog(
                backgroundColor: Color(0xFF480945),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Big thanks for watching the ad. You guys keep us going!', textAlign: TextAlign.center),
                    Text('Type: ${args['type']}'),
                    Text('Amount: ${args['amount']}'),
                  ],
                ),
              ),
              onWillPop: () async {
                scaffoldState.currentState.hideCurrentSnackBar();
                return true;
              },
            );
          },
        );
        break;
      default:
    }
  }

  @override
  void dispose() {
    rewardedAds.dispose();
    super.dispose();
  }

  Widget profileHeader() {
    return CustomCard(
      title: "Wizard Badge",
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Image.asset('', fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Kartik Pant', style: TextStyle(fontSize: 20)),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Member of ', style: TextStyle(fontSize: 20)),
                      TextSpan(
                          text: '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24))
                    ]))
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(color: Colors.white),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('CURRENT SCORE', textScaleFactor: 1),
                    Text('1034',
                      textScaleFactor: 2,
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ],
                )
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () async {
                    if (await rewardedAds.isLoaded) {
                      rewardedAds.show();
                    } else {
                      showSnackBar('Ad is still loading/ Already watched...');
                    }
                  },
                  color: Color(0xFFDF267C),
                  child:
                    Text('WATCH AD\nEARN SCORE!', textAlign: TextAlign.center),
                )
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget description() {
    return CustomCard(
        title: "About Me",
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Fusce ullamcorper enim a maximus aliquet. Vestibulum gravida et justo quis tempor. '
                'Curabitur ultrices in elit sed tincidunt. Fusce ante orci, pulvinar ac arcu quis, '
                'scelerisque blandit purus. In leo libero, rutrum malesuada leo vel, '
                'consequat faucibus arcu. Praesent sem tortor, porta eleifend aliquet et, '
                'finibus vel nibh. Sed imperdiet odio eget tempor convallis. Curabitur ac porta sapien. '
                'Proin facilisis ipsum nec ante iaculis, sit amet accumsan ligula maximus. '
                'Donec quis leo tincidunt justo ullamcorper varius sed at libero. '
                'Aliquam accumsan volutpat vulputate. Sed laoreet erat eu vestibulum eleifend. '
                'Maecenas fermentum libero sit amet ipsum tristique, sit amet laoreet ligula pretium. '
                'Nulla ornare est blandit bibendum ornare.'),
            Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                color: Color(0xFFDF267C),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.edit, color: Colors.white, size: 18),
                    SizedBox(width: 12),
                    Text('EDIT', textScaleFactor: 1.5)
                  ],
                ),
                onPressed: () {},
              ),
            )
          ],
        ));
  }

  Widget socialMedia() {
    return CustomCard(
      title: 'Social Media',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SocialMediaBadge(handle: 'Facebook'),
          SocialMediaBadge(handle: 'Instagram'),
          SocialMediaBadge(handle: 'LinkedIn'),
          SocialMediaBadge(handle: 'Github'),
          SocialMediaBadge(handle: 'Twitter'),
          SocialMediaBadge(handle: 'Youtube'),
          SocialMediaBadge(handle: 'Personal Website'),
          Align(
            alignment: Alignment.centerRight,
            child: MaterialButton(
              color: Color(0xFFDF267C),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.edit, color: Colors.white, size: 18),
                  SizedBox(width: 12),
                  Text('EDIT', textScaleFactor: 1.5)
                ],
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  void showSnackBar(String content) {
    scaffoldState.currentState.showSnackBar(
      SnackBar(
        content: Text(content),
        duration: Duration(milliseconds: 1500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      body: SingleChildScrollView(
        child: Column(
          children: [
            profileHeader(),
            description(),
            Align(
              alignment: Alignment.center,
              child: AdmobBanner(
                adUnitId: AdmobAds().getBannerId(),
                adSize: AdmobBannerSize.LARGE_BANNER,
              ),
            ),
            socialMedia()
          ],
        ),
      ),
    );
  }
}

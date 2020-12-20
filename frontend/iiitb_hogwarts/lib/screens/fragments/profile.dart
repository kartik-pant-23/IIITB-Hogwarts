import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/services/admob.dart';
import 'package:iiitb_hogwarts/utils/important_strings.dart';
import 'package:iiitb_hogwarts/widgets/iiitb_hogwarts_card.dart';
import 'package:iiitb_hogwarts/widgets/social_media_badge.dart';

class Profile extends StatelessWidget {
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
                  child: Image.asset(GROUP_LOGOS[0], fit: BoxFit.cover),
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
                          text: GROUP_NAMES[0],
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
                  Text('PROFILE LIKES', textScaleFactor: 1),
                  Text('74',
                      textScaleFactor: 2,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              )),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('CURRENT SCORE', textScaleFactor: 1),
                  Text('1034',
                      textScaleFactor: 2,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ))
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}

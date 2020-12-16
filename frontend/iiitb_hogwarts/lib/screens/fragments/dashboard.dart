import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/blog.dart';
import 'package:iiitb_hogwarts/services/admob.dart';
import 'package:iiitb_hogwarts/utils/important_strings.dart';
import 'package:iiitb_hogwarts/widgets/blogs_banner.dart';
import 'package:iiitb_hogwarts/widgets/discussion_banner.dart';
import 'package:iiitb_hogwarts/widgets/leaderboard_badge.dart';
import 'package:iiitb_hogwarts/widgets/website_banner.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Text(
              'CURRENT LEADERBOARD',
            ),
            LeaderBoardBadge(
              groupCode: 0,
            ),
            LeaderBoardBadge(
              groupCode: 1,
            ),
            LeaderBoardBadge(
              groupCode: 2,
            ),
            LeaderBoardBadge(
              groupCode: 3,
            ),
            SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.center,
              child: AdmobBanner(
                adUnitId: AdmobAds().getBannerId(),
                adSize: AdmobBannerSize.BANNER,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'BLOGS FROM AMONG US',
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return BlogsBanner(blog: Blog());
                },
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'JOIN THE ANONYMOUS DISCUSSION',
            ),
            DiscussionBanner(),
            SizedBox(
              height: 16,
            ),Align(
              alignment: Alignment.center,
              child: AdmobBanner(
                adUnitId: AdmobAds().getBannerId(),
                adSize: AdmobBannerSize.LARGE_BANNER,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'OFFICIAL WEBSITE',
            ),
            WebsiteBanner(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

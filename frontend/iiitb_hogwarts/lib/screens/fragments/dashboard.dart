import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/blog.dart';
import 'package:iiitb_hogwarts/models/home_page_data.dart';
import 'package:iiitb_hogwarts/services/admob.dart';
import 'package:iiitb_hogwarts/widgets/blogs_banner.dart';
import 'package:iiitb_hogwarts/widgets/discussion_banner.dart';
import 'package:iiitb_hogwarts/widgets/leaderboard_badge.dart';
import 'package:iiitb_hogwarts/widgets/website_banner.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    HomePageData data = HomePageData();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Text(
              'CURRENT LEADERBOARD',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: data.groups.map<Widget>((group) => LeaderBoardBadge(group: group)).toList(),
            ),
            SizedBox(
              height: 16,
            ),
            Align(
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
              'BLOGS FROM AMONG US',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.blogs.length,
                itemBuilder: (context, index) {
                  return BlogsBanner(blog: data.blogs[index]);
                },
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'JOIN THE ANONYMOUS DISCUSSION',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DiscussionBanner(discussion: data.discussion),
            SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.center,
              child: AdmobBanner(
                adUnitId: AdmobAds().getBannerId(),
                adSize: AdmobBannerSize.MEDIUM_RECTANGLE,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'OFFICIAL WEBSITE',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            WebsiteBanner(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

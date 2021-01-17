import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/user.dart';
import 'package:iiitb_hogwarts/services/admob.dart';
import 'package:iiitb_hogwarts/services/load_data.dart';
import 'package:iiitb_hogwarts/widgets/iiitb_hogwarts_card.dart';
import 'package:iiitb_hogwarts/widgets/social_media_badge.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfile extends StatefulWidget {
  final User user;

  UserProfile({@required this.user});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final scaffoldState = GlobalKey<ScaffoldState>();

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
                  child: Hero(
                      tag: widget.user.group.groupLogo,
                      child: Image.network(widget.user.group.groupLogo,
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(widget.user.name),
                      fit: BoxFit.fitWidth,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(text: 'Member of '),
                      TextSpan(
                          text: widget.user.group.name,
                          style: TextStyle(fontWeight: FontWeight.bold))
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('CURRENT SCORE', textScaleFactor: 1),
              Text('${widget.user.score}',
                  textScaleFactor: 1.8,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  Widget description() {
    return Visibility(
      visible: widget.user.about.isNotEmpty,
      child: CustomCard(title: "About", child: Text(widget.user.about)),
    );
  }

  Widget socialMedia({User user}) {
    return Visibility(
      visible: !user.hasNoSocialMedia(),
      child: CustomCard(
        title: 'Social Media',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SocialMediaBadge(handle: 'Facebook', link: user.facebook),
            SocialMediaBadge(handle: 'Instagram', link: user.instagram),
            SocialMediaBadge(handle: 'LinkedIn', link: user.linkedId),
            SocialMediaBadge(handle: 'Github', link: user.github),
            SocialMediaBadge(handle: 'Twitter', link: user.twitter),
            SocialMediaBadge(handle: 'Youtube', link: user.youtube),
            SocialMediaBadge(handle: 'Personal Website', link: user.personal),
          ],
        ),
      ),
    );
  }

  Widget blogsData({User user}) {
    return Visibility(
      visible: user.blogs.isNotEmpty,
      child: CustomCard(
        title: 'Blogs Board',
        child: Container(
          width: double.infinity,
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: user.blogs.length,
            itemBuilder: (context, index) {
              return AspectRatio(
                aspectRatio: 3/4,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(user.blogs[index].bannerUrl),
                      fit: BoxFit.cover
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      if (await canLaunch(user.blogs[index].blogUrl)) {
                        await launch(user.blogs[index].blogUrl);
                      } else {
                        throw 'Could not launch ${user.blogs[index].blogUrl}';
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black87],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter
                        )
                      ),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        user.blogs[index].blogTitle,
                        textScaleFactor: 1.5,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
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
            FutureBuilder(
              future: DataLoader().loadUserData(widget.user.userId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      blogsData(user: snapshot.data),
                      socialMedia(user: snapshot.data)
                    ],
                  );
                }
                return Container();
              },
            ),
            Align(
              alignment: Alignment.center,
              child: AdmobBanner(
                adUnitId: AdmobAds().getBannerId(),
                adSize: AdmobBannerSize.LARGE_BANNER,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

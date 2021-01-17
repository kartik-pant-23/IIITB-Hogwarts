import 'dart:async';
import 'dart:ui';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/user.dart';
import 'package:iiitb_hogwarts/services/admob.dart';
import 'package:iiitb_hogwarts/services/send_data.dart';
import 'package:iiitb_hogwarts/widgets/iiitb_hogwarts_card.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AdmobReward rewardedAds = AdmobReward(adUnitId: AdmobAds().getRewardAdId());
  final scaffoldState = GlobalKey<ScaffoldState>();
  User currentUser;
  StreamController alertController;

  @override
  void initState() {
    alertController = StreamController();
    currentUser = Provider.of<User>(context, listen: false);
    rewardedAds = AdmobReward(
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
                    Text(
                        'Big thanks for watching the ad. You guys keep us going!',
                        textAlign: TextAlign.center),
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
    alertController.close();
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
                    FittedBox(
                      child: Text('Kartik Pant'),
                      fit: BoxFit.fitWidth,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(text: 'Member of '),
                      TextSpan(
                          text: 'Inventors',
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
            children: [
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('CURRENT SCORE', textScaleFactor: 1),
                  Text('15',
                      textScaleFactor: 1.8,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              )),
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
              )),
            ],
          )
        ],
      ),
    );
  }

  Widget blogsData() {
    return Visibility(
      visible: true,
      child: CustomCard(
        title: 'Blogs Board',
        child: Container(
          width: double.infinity,
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return AspectRatio(
                aspectRatio: 3/4,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    /*image: DecorationImage(
                        image: NetworkImage(user.blogs[index].bannerUrl),
                        fit: BoxFit.cover
                    ),*/
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      /*if (await canLaunch(user.blogs[index].blogUrl)) {
                        await launch(user.blogs[index].blogUrl);
                      } else {
                        throw 'Could not launch ${user.blogs[index].blogUrl}';
                      }*/
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
                        'Test Blog',
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

  Widget description() {
    return CustomCard(
        title: "About Me",
        child: TextFormField(
            initialValue: currentUser.about,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            minLines: 5,
            decoration: InputDecoration(
                hintText: 'Write about yourself...',
                contentPadding: EdgeInsets.all(10),
                filled: true,
                fillColor: Color(0xFFFFFFFF).withOpacity(0.40),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide.none)),
            onSaved: (value) => currentUser.about = value.trim() ?? ""));
  }

  Widget textBox({String header, String initialValue, Function onSaved}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header),
          TextFormField(
              initialValue: initialValue,
              keyboardType: TextInputType.url,
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: "https://www.${header.split(' ')[0].toLowerCase()}.com/",
                  contentPadding: EdgeInsets.all(10),
                  filled: true,
                  fillColor: Color(0xFFFFFFFF).withOpacity(0.40),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none)),
              onSaved: onSaved)
        ],
      ),
    );
  }

  Widget socialMedia() {
    return CustomCard(
      title: 'Social Media',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textBox(
              header: 'Facebook',
              initialValue: currentUser.facebook,
              onSaved: (value) =>
                  currentUser.facebook = value.trim() ?? ""),
          textBox(
              header: 'Instagram',
              initialValue: currentUser.instagram,
              onSaved: (value) =>
                  currentUser.instagram = value.trim() ?? ""),
          textBox(
              header: 'LinkedIn',
              initialValue: currentUser.linkedId,
              onSaved: (value) =>
                  currentUser.linkedId = value.trim() ?? ""),
          textBox(
              header: 'Github',
              initialValue: currentUser.github,
              onSaved: (value) =>
                  currentUser.github = value.trim() ?? ""),
          textBox(
              header: 'Twitter',
              initialValue: currentUser.twitter,
              onSaved: (value) =>
                  currentUser.twitter = value.trim() ?? ""),
          textBox(
              header: 'Youtube',
              initialValue: currentUser.youtube,
              onSaved: (value) =>
                  currentUser.youtube = value.trim() ?? ""),
          textBox(
              header: 'Personal Website',
              initialValue: currentUser.personal,
              onSaved: (value) =>
                  currentUser.personal = value.trim() ?? "")
        ],
      ),
    );
  }

  void showSnackBar(String content) {
    scaffoldState.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Color(0xFF480945),
        content: Text(content),
        duration: Duration(milliseconds: 1500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                profileHeader(),
                blogsData(),
                description(),
                Align(
                  alignment: Alignment.center,
                  child: AdmobBanner(
                    adUnitId: AdmobAds().getBannerId(),
                    adSize: AdmobBannerSize.LARGE_BANNER,
                  ),
                ),
                socialMedia(),
                Align(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    child: Text('Save Changes'),
                    color: Color(0xFFDF267C),
                    onPressed: () async {
                      alertController.add("Saving changes");
                      bool result = await DataUploader().patchUserProfile(currentUser);
                      alertController.add(
                          (result) ?'Posted successfully!' :'Something went wrong!'
                      );

                      Future.delayed(Duration(milliseconds: 2000), () {
                        alertController.add(null);
                      });
                    },
                  ),
                ),
                SizedBox(height: 12)
              ],
            ),
          ),
          StreamBuilder(
            stream: alertController.stream,
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                  child: Container(
                    height: double.infinity, width: double.infinity,
                    alignment: Alignment.center,
                    color: Color(0xFF480945).withOpacity(0.50),
                    child: AlertDialog(
                      backgroundColor: Color(0xFF480945),
                      contentPadding: const EdgeInsets.all(12),
                      content: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: snapshot.data == 'Saving changes',
                            child: CircularProgressIndicator(),
                          ),
                          SizedBox(width: 8),
                          Expanded(child: Text(snapshot.data, textAlign: TextAlign.center, softWrap: true))
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}

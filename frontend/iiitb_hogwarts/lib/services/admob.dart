import 'dart:io';

class AdmobAds {

  final String _bannerIdAndroid = "ca-app-pub-5494677257292197/8630944110";
  final String _bannerIdIos = "not_yet_created";
  final String _rewardedIdAndroid = "ca-app-pub-5494677257292197/3354566707";
  final String _rewardedIdIos = "not_yet_created";

  String getBannerId() {
    if(Platform.isAndroid)
      return _bannerIdAndroid;
    else if(Platform.isIOS)
      return _bannerIdIos;
    return null;
  }

  String getRewardAdId() {
    if(Platform.isAndroid)
      return _rewardedIdAndroid;
    else if(Platform.isIOS)
      return _rewardedIdIos;
    return null;
  }

}
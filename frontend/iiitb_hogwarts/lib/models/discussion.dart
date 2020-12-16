class Discussion {

  String bannerUrl;
  String title;
  String joinCount;

  Discussion({
    this.bannerUrl,
    this.title,
    this.joinCount});

  Discussion.fromJson(jsonObject) {
    this.bannerUrl=jsonObject['banner_url'];
    this.title=jsonObject['title'];
    this.joinCount=jsonObject['join_count'];
  }

}
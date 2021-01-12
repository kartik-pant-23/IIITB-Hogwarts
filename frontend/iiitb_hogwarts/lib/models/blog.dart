class Blog {
  String bannerUrl;
  String blogUrl;
  String blogTitle;
  String authorName;
  String authorYear;
  String authorUid;

  Blog({this.blogTitle, this.blogUrl, this.bannerUrl, this.authorName, this.authorYear, this.authorUid});

  Blog.fromJson(jsonObject) {
    this.bannerUrl = jsonObject['banner_url'];
    this.blogUrl = jsonObject['blog_url'];
    this.blogTitle = jsonObject['blog_title'];
    this.authorName = jsonObject['author_name'];
    this.authorYear = jsonObject['author_year'];
  }

  Map<String, String> toJson() {
    return {
      "blog_url": this.blogUrl,
      "banner_url": this.bannerUrl,
      "blog_title": this.blogTitle,
      "author_name": this.authorName,
      "author_year": this.authorYear,
      "author_uid": this.authorUid,
    };
  }
}

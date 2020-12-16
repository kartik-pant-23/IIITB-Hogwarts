class Blog {
  String bannerUrl;
  String blogUrl;
  String authorName;
  String authorYear;

  Blog({
    this.bannerUrl,
    this.blogUrl,
    this.authorName,
    this.authorYear});

  Blog.fromJson(jsonObject) {
    this.bannerUrl = jsonObject['banner_url'];
    this.blogUrl = jsonObject['blog_url'];
    this.authorName = jsonObject['author_name'];
    this.authorYear = jsonObject['author_year'];
  }
}

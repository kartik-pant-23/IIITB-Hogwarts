class Blog {
  String bannerUrl = "https://media.geeksforgeeks.org/img-practice/banner/java-app-development-thumbnail-old.png";
  String blogUrl = "https://practice.geeksforgeeks.org/courses/java-app-development";
  String blogTitle = "Android App Development";
  String authorName = "Kartik Pant";
  String authorYear = "2nd Year, CSE";

  /*Blog({
    this.bannerUrl,
    this.blogUrl,
    this.authorName,
    this.authorYear});*/
  Blog();

  Blog.fromJson(jsonObject) {
    this.bannerUrl = jsonObject['banner_url'];
    this.blogUrl = jsonObject['blog_url'];
    this.blogTitle = jsonObject['blog_title'];
    this.authorName = jsonObject['author_name'];
    this.authorYear = jsonObject['author_year'];
  }
}

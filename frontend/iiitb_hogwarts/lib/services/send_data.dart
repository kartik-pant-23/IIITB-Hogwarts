import 'package:iiitb_hogwarts/models/blog.dart';
import 'package:iiitb_hogwarts/models/user.dart';
import 'package:iiitb_hogwarts/utils/important_strings.dart';

import 'package:http/http.dart' as http;

class DataUploader {

  Future<bool> postBlog(Blog blog) async {
    try {
      Uri uri = Uri.https(BASE_URL, ADD_BLOGS);
      var response = await http.post(uri, body: blog.toJson());
      if(response.statusCode!=200) {
        print("PostingBlogFailed: "+response.body);
        return false;
      }
      return true;
    } catch(err) {
      print("PostingBlogError: "+err.toString());
      return false;
    }
  }

  Future<bool> patchUserProfile(User user) async {
    try {
      Uri uri = Uri.https(BASE_URL, '$USERS/${user.userId}');
      var response = await http.patch(uri, body: user.toJson());
      if(response.statusCode!=200) {
        print("PatchingUserFailed: "+response.body);
        return false;
      }
      return true;
    } catch(err) {
      print("PatchingUserError: "+err.toString());
      return false;
    }
  }

}
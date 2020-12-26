import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/widgets/iiitb_hogwarts_card.dart';

class GetFeatured extends StatefulWidget {

  @override
  _GetFeaturedState createState() => _GetFeaturedState();
}

class _GetFeaturedState extends State<GetFeatured> {

  String details = 'In IIITB Hogwarts, you get the opportunity to get featured in front of the college through your blogs. '
      'If you are interested for the same, this place is for you.\n\n'
      '1. Before you get started make sure you have your blog on web, so that you have a valid URL for the same.\n'
      '2. Choose a picture as banner for your blog, copy the URL.. paste it here.\n'
      '3. Type in a short explanatory title for your blog.\n'
      '4. Fill in your details, and you are ready post.\n\n'
      'Make sure all the information you place is valid and you don\'t play cheeky. We check the blogs before posting, and '
      'your userId is stored and well known to developers, you are always in our reach.';
  bool seeDetails = false;

  String _blogUrl, _blogBannerUrl, _blogTitle;
  String _bloggerName, _bloggerYear;

  final _formKey = GlobalKey<FormState>();

  Widget pageHeader() {
    return CustomCard(
      title: 'Details',
      child: Column(
        children: [
          Text(
              (seeDetails) ?details :'In IIITB Hogwarts, you get the opportunity to get featured in front of the college through your blogs...'
          ),
          Align(
            alignment: Alignment.center,
            child: MaterialButton(
              color: Color(0xFFDF267C),
              child: Text((seeDetails) ?'HIDE DETAILS' :'SEE DETAILS'),
              onPressed: () {
                setState(() {
                  seeDetails = !seeDetails;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget textField(Function onSaved, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            filled: true,
            fillColor: Color(0xFFFFFFFF).withOpacity(0.40),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none)
        ),
        validator: (value){
          if(value.isEmpty || value.trim().isEmpty)
            return '$hintText is required';
          return null;
        },
        onSaved: onSaved
      ),
    );
  }

  Widget blogDetails() {
    return CustomCard(
      title: 'Blog Details',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          textField((value) => _blogUrl=value, 'Blog URL'),
          textField((value) => _blogBannerUrl=value, 'Blog Banner URL'),
          textField((value) => _blogTitle=value, 'Blog Title URL'),
        ],
      ),
    );
  }

  Widget bloggerDetails() {
    return CustomCard(
      title: 'Blogger Details',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          textField((value) => _bloggerName=value, 'Your name'),
          textField((value) => _bloggerYear=value, 'Batch year'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            pageHeader(),
            blogDetails(),
            bloggerDetails(),
            Align(
              alignment: Alignment.center,
              child: MaterialButton(
                color: Color(0xFFDF267C),
                child: Text('POST BLOG'),
                onPressed: () {
                  if(!_formKey.currentState.validate()) {
                    return;
                  }
                  _formKey.currentState.save();
                  print('{Name: $_bloggerName\nYear: $_bloggerYear}');
                  _formKey.currentState.reset();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

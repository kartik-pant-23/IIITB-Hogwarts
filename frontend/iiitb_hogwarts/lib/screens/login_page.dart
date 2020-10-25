import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iiitb_hogwarts/models/user.dart';
import 'package:iiitb_hogwarts/screens/home_page.dart';
import 'package:iiitb_hogwarts/screens/register_page.dart';
import 'package:iiitb_hogwarts/services/authentication.dart';
import 'package:iiitb_hogwarts/widgets/background_image.dart';
import 'package:iiitb_hogwarts/widgets/transition.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {

  //Parameters
  String _email;
  String _password;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //Build each form field
  Widget _buildEmail(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          prefixIcon: Container(margin: EdgeInsets.fromLTRB(4,4,8,4) ,child: CircleAvatar(
            backgroundColor: Color(0xFFFFFFFF),
            backgroundImage: AssetImage('images/ic_email_id.jpg'),
          )),
          hintText: 'Email address',
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          filled: true,
          fillColor: Color(0xFFFFFFFF).withOpacity(0.40),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none)
      ),
      validator: (value){
        if(value.isEmpty)
          return 'Email is required';
        return null;
      },
      onSaved: (value){
        _email = value;
      },
    );
  }
  Widget _buildPassword(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          prefixIcon: Container(margin: EdgeInsets.fromLTRB(4,4,8,4) ,child: CircleAvatar(
              backgroundColor: Color(0xFFFFFFFF),
              child: Padding(padding: EdgeInsets.all(6),
                child:SvgPicture.asset('images/ic_password.svg', fit: BoxFit.cover,),
              ))),
          hintText: 'Password',
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          filled: true,
          fillColor: Color(0xFFFFFFFF).withOpacity(0.40),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none)
      ),
      validator: (value){
        if(value.isEmpty)
          return 'Password is required';
        return null;
      },
      onSaved: (value){
        _password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: BackgroundImage(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Center(
            child: SingleChildScrollView(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Login',
                  textScaleFactor: 2,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(height: 25),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildEmail(),
                      SizedBox(height: 10),
                      _buildPassword(),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text('Not a member?', textScaleFactor: 1,),
                          SizedBox(width: 5),
                          FlatButton(
                            textColor: Theme.of(context).accentColor,
                            child: Text('Register', textScaleFactor: 1,),
                            onPressed: () { navigateTo(RegisterPage(), context); },
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          color: Color(0xFFFFFFFF).withOpacity(0.50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                          ),
                          child: Text('LOGIN', textScaleFactor: 1.5,),
                          onPressed: () async {
                            if(!_formKey.currentState.validate()) {
                              return;
                            }
                            _formKey.currentState.save();
                            bool loginResult = await login(_email, _password, user);
                            if(loginResult) {
                              navigateTo(HomePage(), context, type: 1);
                            } else {
                              _scaffoldKey.currentState.showSnackBar(
                                SnackBar(content: Text('Unknown error occurred!', style: Theme.of(context).textTheme.bodyText1,),
                                    backgroundColor: Theme.of(context).accentColor,)
                              );
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }

  void navigateTo(Widget widget, BuildContext context, {int type=0}){
    if(type==1) {
      Navigator.push(context, SlideLeftRouteBounce(widget: widget));
    } else {
      Navigator.push(context, SlideRightRouteBounce(widget: widget));
    }
  }
}

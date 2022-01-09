import 'package:demo_dog_path/Common/commanVar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'dart:convert' as JSON;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Common/customWidget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  late FacebookLoginResult result;
  var profile;
  String FirstnameFB = "", LastNameFB = "", EmailFB = "";


  @override
  Widget build(BuildContext context) {

    Future<void> _loginFB() async {
SharedPreferences preferences = await SharedPreferences.getInstance();
      result = await facebookSignIn.logIn(['email']);
      print("result dfv " + result.toString());
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          final FacebookAccessToken accessToken = result.accessToken;
          final graphResponse = await http.get(Uri.parse(
              'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${result.accessToken.token}'));
          setState(() {
            profile = JSON.jsonDecode(graphResponse.body);
            EmailFB = profile["email"].toString().trim();
            // EmailFB ="null";
            FirstnameFB = profile["first_name"].toString().trim();
            LastNameFB = profile["last_name"].toString();
            preferences.setString("FirstnameFB", FirstnameFB);

            Navigator.pushReplacementNamed(context, '/homePage');

            print(profile.toString() +
                " email" +
                EmailFB +
                "Fname" +
                FirstnameFB +
                " " +
                LastNameFB);
          });
          break;
        case FacebookLoginStatus.cancelledByUser:
          print('Login cancelled by the user.');
          break;
        case FacebookLoginStatus.error:
          print('Something went wrong with the login process.\n'
              'Here\'s the error Facebook gave us: ${result.errorMessage}');
          break;
      }
    }

    return Scaffold(
      backgroundColor: CommonVar().backGroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomWidget().textWidget("Sign In", 30,Colors.white),
              SizedBox(height: 15),
              CustomWidget().textWidget("Sign In With Your Facebook Account", 15,Colors.white),
              SizedBox(height: 15),
              SignInButton(Buttons.Facebook,
                  onPressed: (){
                _loginFB();
              }),

            ],
          ),
        ),
      ),
    );
  }
}

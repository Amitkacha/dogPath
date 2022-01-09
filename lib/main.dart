import 'package:demo_dog_path/Common/commanVar.dart';
import 'package:demo_dog_path/signInPage.dart';
import 'package:flutter/material.dart';

import 'Common/customWidget.dart';
import 'homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Path',
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      theme: ThemeData(
        primaryColor: Colors.black12,
      ),
      routes: <String, WidgetBuilder>{
        '/signIn': (context) => SignInPage(),
        '/homePage':(context) => HomePage(),
      },
      initialRoute: '/',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
        const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/signIn');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonVar().backGroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 200,
                width: 200,
                child:
                    new Image(image: new AssetImage("assets/image_dog.gif"))),
            CustomWidget().textWidget("Dog's Path", 35,Colors.grey),
            CustomWidget().textWidget("by", 20,Colors.grey),
            CustomWidget().textWidget("VirtouStack Software Pvt. Lmt.", 20,Colors.grey),
          ],
        ),
      ),
    );
  }
}

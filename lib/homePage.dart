import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userName ;
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  Future<void> getData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userName = preferences.getString("FirstnameFB");
    print("userName == $userName");
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

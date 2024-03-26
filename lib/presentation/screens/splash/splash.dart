import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:naffith/presentation/screens/welcome/welcome.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _move();
  }
 _move() async {

    await Future.delayed(Duration ( seconds: 3),(){});
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>Welcome(),
      ),
    );
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(23, 56, 61, 1),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [

               Center(
                 child: Container(
                   width: 375.h,
                   height: 650.h,
                   padding: EdgeInsets.only(top: 211.h),
                   child: Image.asset('assets/images/Naffithlogo.png'),
                 ),
               ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

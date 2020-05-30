import 'package:flutter/material.dart';
import 'SelectStore.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => SelectStore()));
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0, bottom: 32),
          child: Container(
            child: Text(
              "Find your location and become next in line.",
              style: TextStyle(
                  color: Color(0xffE1F5FF),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash.jpg"), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Simplicity and Privacy",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xffE1F5FF),
                    fontSize: 18,
                    letterSpacing: 0.9,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "VirtualQ",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    letterSpacing: 1.9,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Get told via SMS or App your wait time and when to arrive at the store entrance.",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xffE1F5FF),
                    fontSize: 18,
                    letterSpacing: 1.9,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ),
    );
  }
}
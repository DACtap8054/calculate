import 'package:flutter/material.dart';

class LOADINGSCREEN extends StatelessWidget {
  const LOADINGSCREEN({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Stack(
            children: [
              Positioned(
                top: 0,
                left: 2,
                child: Image.asset(
                  'assets/images/5.png',
                  width: 370,
                  height: 130,
                ),
              ),
              Positioned(
                top: 0,
                left: 170,
                child: Image.asset(
                  'assets/images/Group-9.png',
                  width: 55,
                  height: 130,
                ),
              ),
              // Add buttons in the app bar
            ],
          ),
        ),
        //body: 
    );
  }
}

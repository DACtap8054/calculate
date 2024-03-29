import 'package:calculate/srceen/Signin.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});



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
                left: 160,
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
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [

              Positioned(
                top: 90.0,
                left: 88.0,
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  child: Image(
                    image: AssetImage('assets/images/Group-7.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              Positioned(
                top: 350,
                right: 5,
                child: Row(
                  children: [
                      /*ElevatedButton(
                       onPressed: () {
                        // Handle registration button press
                      print('สร้างบัญชีผู้ใช้งาน');

                        // Navigate to the Register screen
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => REGISTERSCREEN()),
                      );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(33, 150, 243, 1), // Set button color
                        onPrimary: const Color.fromRGBO(255, 255, 255, 1), // Set text color
                        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10), // Set button padding
                        textStyle: TextStyle(
                          fontSize: 16, // Set text size
                          fontFamily: 'Kanit', // Set font family
                        ),
                      ),
                      child: Text('สร้างบัญชีผู้ใช้งาน'),
                    ),
                    SizedBox(width: 15),*/
                    Padding(
                      padding: EdgeInsets.only(top: 50.0,right: 90.0), // ปรับ top padding ตามต้องการ
                      child: ElevatedButton(
                      onPressed: () {
                        // จัดการการกดปุ่มเข้าสู่ระบบ
                        print('เข้าสู่ระบบ');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignInScreen()),
                          );
                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(255, 255, 255, 1), // กำหนดสีปุ่ม
                          onPrimary: Color.fromRGBO(33, 150, 243, 1), // กำหนดสีข้อความ
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10), // กำหนด padding ของปุ่ม
                          textStyle: TextStyle(
                            fontSize: 16, // กำหนดขนาดข้อความ
                            fontFamily: 'Kanit', // กำหนด font family
                          ),
                        ),
                        child: Text('เข้าสู่ระบบ'),
                      ),
                    )
                  ],
                ),
              ),
            ],
        ) 
    )

    );
}


  
      
}